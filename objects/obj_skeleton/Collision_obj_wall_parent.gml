for (var i = 1; i < 1000; i+=1){
		if (!place_meeting(x, y-i, obj_wall_parent)){
			y-=i
			break
		}
		if (!place_meeting(x+i, y, obj_wall_parent)){
			x+=i
			break
		}
		if (!place_meeting(x-i, y, obj_wall_parent)){
			x-=i
			break
		}
		if (!place_meeting(x, y+i, obj_wall_parent)){
			y+=i
			break
		}
		if (!place_meeting(x+i, y+i, obj_wall_parent)){
			x+=i
			y+=i
			break
		}
		if (!place_meeting(x+i, y-i, obj_wall_parent)){
			x+=i
			y-=i
			break
		}
		if (!place_meeting(x-i, y+i, obj_wall_parent)){
			y+=i
			x-=i
			break
		}
		if (!place_meeting(x-i, y-i, obj_wall_parent)){
			y-=i
			x-=i
			break
		}
}