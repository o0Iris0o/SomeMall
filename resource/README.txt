部署时须要更改文件路径的类及对应字段：（相应文件在此resource包中）

com.somemall.web.controller.ForgetPwdMailController
String fileNames[] = { "/Users/o0iris0o/Desktop/navlogo.png;logo.jpg" };


com.somemall.service.recommender.ItemCFRecommender
DataModel model = new FileDataModel(new File("/Users/o0iris0o/Desktop/testdata.txt"));

com.somemall.service.recommender.MySlopeOneRecommender
DataModel model = new FileDataModel(new File("/Users/o0iris0o/Desktop/testdata.txt"));


com.somemall.service.recommender.UserCFRecommender
String file = "/Users/o0iris0o/Desktop/testdata.txt";
