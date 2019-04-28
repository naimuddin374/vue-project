<?php
namespace App\Http\Controllers;
use App\UserModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image as Image;
use Carbon\Carbon;

class UserController extends Controller
{

	public function index(Request $request)
	{
		return $this->getAllUsers();
	}

	public function insert(Request $request){
		$post = $request->all();
		$validatedData = $request->validate([
			'name' => 'required',
			'email' => 'required',
			'contact_no' => 'required',
		]);
		if(empty($validatedData)){
			return response()->json(['errors'=>$validator->errors()->all()]);
		}	
		if($post['image'][0] == 'd'){
			$imageData = $post['image'];
			$fileName = Carbon::now()->timestamp . '_' . uniqid() . '.' . explode('/', explode(':', substr($imageData, 0, strpos($imageData, ';')))[1])[1];
			$url = 'images/user/'.$fileName;
			Image::make($imageData)->save($url);
		}
		$post_data = [
			'name' => $post['name'],
			'email' => $post['email'],
			'contact_no' => $post['contact_no'],
			'address' => $post['address'],
			'image' => @$url,
		];
		if(!empty($post['id'])){
			$id = $post['id'];
			if(!empty($post_data['image'])){
				$selData = DB::table('users')->where('id', $id)->get();
				if(!empty($selData[0]->image)){
					@unlink(public_path($selData[0]->image));
				}
			}
			DB::table('users')->where('id', $id)->update($post_data);
		}else{
			$id = UserModel::create($post_data)->id;
		}
		if(!empty($id)){
			return $this->getAllUsers();
		}else{
			return request()->json(200,'error');
		}
	}

	public function edit($id=''){
		$all_data = DB::table('users')->where('id', $id)->get();
		return request()->json(200,$all_data);
	}

	public function delete($id=''){
		$selData = DB::table('users')->where('id', $id)->get();
		if(!empty($selData[0]->image)){
			@unlink(public_path($selData[0]->image));
		}
		DB::table('users')->where('id', $id)->delete();
		return $this->getAllUsers();
	}


	private function getAllUsers()
	{
		$all_data = DB::table('users')->orderBy('id', 'desc')->paginate(10);
		return request()->json(200,$all_data);
	}

	
	public function search(Request $request){
		$post = $request->all();
		$wehreData = [];
		if(!empty($post['name'])){
			$wehreData[] = ['users.name', 'like', "%{$post['name']}%"];
		}
		if(!empty($post['email'])){
			$wehreData[] = ['users.email', 'like', "%{$post['email']}%"];
		}
		if(!empty($post['contact_no'])){
			$wehreData[] = ['users.contact_no', 'like', "%{$post['contact_no']}%"];
		}
		if(!empty($post['address'])){
			$wehreData[] = ['users.address', 'like', "%{$post['address']}%"];
		}
		$selData = DB::table("users")->where($wehreData)->get();
		return request()->json(200,$selData);
	}

	public function insert_image(Request $request){
		$post = $request->all();
		return request()->json(200,$post);
	}

}