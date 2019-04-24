class PersonEntity {
	String height;
	String gender;
	String name;

	PersonEntity({this.height, this.gender, this.name});

	PersonEntity.fromJson(Map<String, dynamic> json) {
		height = json['height'];
		gender = json['gender'];
		name = json['name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['high'] = this.height;
		data['gender'] = this.gender;
		data['name'] = this.name;
		return data;
	}
}
