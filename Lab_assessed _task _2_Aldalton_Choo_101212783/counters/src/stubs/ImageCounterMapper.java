package stubs;
import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

/**
 * Example input line:
 * 96.7.4.14 - - [24/Apr/2011:04:20:11 -0400] "GET /cat.jpg HTTP/1.1" 200 12433
 *
 */
public class ImageCounterMapper extends Mapper<LongWritable, Text, Text, IntWritable> {

  @Override
  public void map(LongWritable key, Text value, Context context)
      throws IOException, InterruptedException {

    /*
     * TODO implement
     */
	  //Separate the input line at double qoutes so that can retrieve later again
	  // split at double qoute so that can get "GET /cat.jpg"
	  String[] split1 = value.toString().split("\"");
	  if(split1.length > 1){
		  // since its stored in an array we will get from the 2nd index
		  // where it started which is "GET /cat.jpb HTTP/1.1"
		  String split2 = split1[1];
		  
		  //split the retrieved element from the array starting from spacing
		  //so that we get only /cat.jpg HTTP/1,1
		  split1 = split2.split(" ");
		  
		  if (split1.length > 1 ){
			  //change everything to lower case and store into imageFileName string
			  String imageFileName = split1[1].toLowerCase();
			  // If a file name contains jpg then it will increment the counter group called "jpg"
			  if (imageFileName.endsWith(".jpeg")){
				  context.getCounter("ImageCounter","jpeg").increment(1);
			  }
			// If a file name contains jpg then it will increment the counter group called "gif"
			  else if (imageFileName.endsWith(".gif")){
				  context.getCounter("ImageCounter","gif").increment(1);
			  }
			// If a file name contains other file names
			//then it will increment the counter group called "other"
			  else{
				  context.getCounter("ImageCounter","other").increment(1);
			  }
		  }
		  
	  }

  }
}