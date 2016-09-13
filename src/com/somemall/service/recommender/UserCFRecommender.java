package com.somemall.service.recommender;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.mahout.cf.taste.eval.RecommenderBuilder;
import org.apache.mahout.cf.taste.hadoop.item.RecommenderJob;
import org.apache.mahout.cf.taste.impl.common.FastByIDMap;
import org.apache.mahout.cf.taste.impl.common.FastIDSet;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.GenericBooleanPrefDataModel;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;//EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.UncenteredCosineSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.model.PreferenceArray;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;

/*
 * 
 * 
 * 
 */
public class UserCFRecommender {

	final static int NEIGHBORHOOD_NUM = 3;
	final static int RECOMMENDER_NUM = 7;

	public Map getUserCF(int userid, int number) throws Exception {
		String file = "/Users/o0iris0o/Desktop/testdata.txt";
		Map map = new HashMap();
		DataModel model = new FileDataModel(new File(file));// 

		UserSimilarity user = new PearsonCorrelationSimilarity(model);
		NearestNUserNeighborhood neighbor = new NearestNUserNeighborhood(
				NEIGHBORHOOD_NUM, user, model);
		Recommender r = new GenericUserBasedRecommender(model, neighbor, user);
		LongPrimitiveIterator iter = model.getUserIDs();

		while (iter.hasNext()) {
			long uid = iter.nextLong();
			if (uid == userid) {
				List<RecommendedItem> list = r.recommend(uid, number);

				for (RecommendedItem ritem : list) {
					System.out.printf("(%s,%f)", ritem.getItemID(),
							ritem.getValue());

					map.put(ritem.getItemID()+"", ritem.getValue()+"");

				}
			}

		}
		return map;
	}
}