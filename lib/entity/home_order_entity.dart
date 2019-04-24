class HomeOrderResultEntity {
	dynamic code;
	List<HomeOrderResultData> data;
	bool success;
	dynamic message;

	HomeOrderResultEntity({this.code, this.data, this.success, this.message});

	HomeOrderResultEntity.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		if (json['data'] != null) {
			data = new List<HomeOrderResultData>();
			(json['data'] as List).forEach((v) { data.add(new HomeOrderResultData.fromJson(v)); });
		}
		success = json['success'];
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
		data['success'] = this.success;
		data['message'] = this.message;
		return data;
	}
}

class HomeOrderResultData {
	String customerAddress;
	String accountManagerName;
	String orderNumber;
	int financeChannelId;
	String latitude;
	String typeName;
	HomeOrderResultDataOrderstatus orderStatus;
	String submitOrderTime;
	String customerName;
	int programmeId;
	String customerPhone;
	String createTime;
	int typeId;
	int id;
	String financeChannelName;
	int accountManagerId;
	String accountManagerMobile;
	bool isReject;
	String longitude;

	HomeOrderResultData({this.customerAddress, this.accountManagerName, this.orderNumber, this.financeChannelId, this.latitude, this.typeName, this.orderStatus, this.submitOrderTime, this.customerName, this.programmeId, this.customerPhone, this.createTime, this.typeId, this.id, this.financeChannelName, this.accountManagerId, this.accountManagerMobile, this.isReject, this.longitude});

	HomeOrderResultData.fromJson(Map<String, dynamic> json) {
		customerAddress = json['customerAddress'];
		accountManagerName = json['accountManagerName'];
		orderNumber = json['orderNumber'];
		financeChannelId = json['financeChannelId'];
		latitude = json['latitude'];
		typeName = json['typeName'];
		orderStatus = json['orderStatus'] != null ? new HomeOrderResultDataOrderstatus.fromJson(json['orderStatus']) : null;
		submitOrderTime = json['submitOrderTime'];
		customerName = json['customerName'];
		programmeId = json['programmeId'];
		customerPhone = json['customerPhone'];
		createTime = json['createTime'];
		typeId = json['typeId'];
		id = json['id'];
		financeChannelName = json['financeChannelName'];
		accountManagerId = json['accountManagerId'];
		accountManagerMobile = json['accountManagerMobile'];
		isReject = json['isReject'];
		longitude = json['longitude'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['customerAddress'] = this.customerAddress;
		data['accountManagerName'] = this.accountManagerName;
		data['orderNumber'] = this.orderNumber;
		data['financeChannelId'] = this.financeChannelId;
		data['latitude'] = this.latitude;
		data['typeName'] = this.typeName;
		if (this.orderStatus != null) {
      data['orderStatus'] = this.orderStatus.toJson();
    }
		data['submitOrderTime'] = this.submitOrderTime;
		data['customerName'] = this.customerName;
		data['programmeId'] = this.programmeId;
		data['customerPhone'] = this.customerPhone;
		data['createTime'] = this.createTime;
		data['typeId'] = this.typeId;
		data['id'] = this.id;
		data['financeChannelName'] = this.financeChannelName;
		data['accountManagerId'] = this.accountManagerId;
		data['accountManagerMobile'] = this.accountManagerMobile;
		data['isReject'] = this.isReject;
		data['longitude'] = this.longitude;
		return data;
	}
}

class HomeOrderResultDataOrderstatus {
	String code;
	String name;
	String message;

	HomeOrderResultDataOrderstatus({this.code, this.name, this.message});

	HomeOrderResultDataOrderstatus.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		name = json['name'];
		message = json['message'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['name'] = this.name;
		data['message'] = this.message;
		return data;
	}
}
