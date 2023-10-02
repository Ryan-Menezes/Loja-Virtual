<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model{
	public $table = 'products';
	protected $fillable = ['name', 'slug', 'brand', 'description', 'details', 'video', 'visible', 'ratings_active', 'freight_free', 'showcase', 'installment_no_interest'];
	public $timestamps = true;

	public function getRolesCreateAttribute(){
		return [
			'name' 				=> "required|min:1|max:191|unique:{$this->table},name",
			'brand' 			=> 'required|min:1|max:191',
			'description' 		=> 'required|min:1',
			'details'			=> 'required|min:1'
		];
	}

	public function getRolesUpdateAttribute(){
		return [
			'name' 				=> "required|min:1|max:191|unique:{$this->table},name,{$this->id},id",
			'brand' 			=> 'required|min:1|max:191',
			'description' 		=> 'required|min:1',
			'details'			=> 'required|min:1'
		];
	}

	public function getCreatedAtFormatAttribute(){
		if(empty($this->created_at))
			return null;

		return date('d/m/Y H:i:s', strtotime($this->created_at));
	}

	public function getUpdatedAtFormatAttribute(){
		if(empty($this->updated_at))
			return null;

		return date('d/m/Y H:i:s', strtotime($this->updated_at));
	}

	public function getMessagesAttribute(){
		return [
			'name.required' 			=> 'O preenchimento do campo titulo é obrigatório!',
			'name.min' 					=> 'O campo nome deve conter no mínimo %min% caracteres!',
			'name.max' 					=> 'O campo nome deve conter no máximo %max% caracteres!',
			'name.unique' 				=> 'Este nome já está sendo utilizado, Tente outro nome!',
			'brand.required' 			=> 'O preenchimento do campo marca é obrigatório!',
			'brand.min' 				=> 'O campo marca deve conter no mínimo %min% caracteres!',
			'brand.max' 				=> 'O campo marca deve conter no máximo %max% caracteres!',
			'description.required' 		=> 'O preenchimento do campo descrição é obrigatório!',
			'description.min' 			=> 'O campo descrição deve conter no mínimo %min% caracteres!',
			'details.required' 			=> 'O preenchimento do campo detalhes é obrigatório!',
			'details.min' 				=> 'O campo detalhes deve conter no mínimo %min% caracteres!'
		];
	}

	public function getPriceFormatAttribute(){
		$size = $this->sizes()->first();

		if(empty($size->price))
			return null;

		return number_format($size->price, 2, ',', '.');
	}

	public function getPricePreviousFormatAttribute(){
		$size = $this->sizes()->first();

		if(empty($size->price_previous))
			return null;;

		return number_format($size->price_previous, 2, ',', '.');
	}

	public function getFirstImageAttribute(){
		if(empty($this->images()->first()->source))
			return null;

		return $this->images()->first()->source;
	}

	public function getVideoFormatAttribute(){
		if(empty($this->video))
			return null;

		$url = preg_split('/[\/=]/i', $this->video);

		return end($url);
	}

	public function scopeSearch($query, $page = 1, $filter = '', $limit = null){
		$limit = $limit ?? config('paginate.limit');
		$page = ($page - 1) * $limit;

		return $query
					->with('ratings')
					->orWhere('name', 'LIKE', "%{$filter}%")
					->orWhere('slug', 'LIKE', "%{$filter}%")
					->orWhere('description', 'LIKE', "%{$filter}%")
					->orderBy('id', 'DESC')
					->offset($page)
					->limit($limit);
	}

	public function verifyPermission(string $permission){
		if(!can($permission)){
			abort(404);
		}
	}

	public function getDiscount(int $installment){
		$discount = $this->discounts->where('installment', $installment)->first();

		if(!$discount)
			return 0;

		return $discount->percent;
	}

	public function getPercentStars(int $stars){
		return ((100 * $this->ratings()->where('visible', true)->where('stars', $stars)->count()) / $this->ratings()->where('visible', true)->count());
	}	

	public function subcategories(){
		return $this->belongsToMany(SubCategory::class, 'products_subcategories', 'product_id', 'subcategory_id');
	}

	public function colors(){
		return $this->hasMany(ProductColor::class, 'product_id', 'id');
	}

	public function images(){
        return $this->hasManyThrough(ProductImage::class, ProductColor::class);
    }

	public function sizes(){
        return $this->hasManyThrough(ProductSize::class, ProductColor::class);
    }

    public function discounts(){
		return $this->hasMany(ProductDiscount::class, 'product_id', 'id');
	}

    public function ratings(){
		return $this->hasMany(Rating::class, 'product_id', 'id');
	}

	public function relateds(){
		return $this->hasMany(ProductRelated::class, 'product_id', 'id');
	}

	protected static function booted(): void
    {
		$fn = fn () => cache()->forget('site-categories-products');

        static::created($fn);
		static::deleted($fn);
		static::updated($fn);
    }
}