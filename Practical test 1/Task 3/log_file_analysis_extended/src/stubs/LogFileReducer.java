package stubs;
import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class LogFileReducer extends Reducer<Text, IntWritable, Text, IntWritable> {

  @Override
  public void reduce(Text key, Iterable<IntWritable> values, Context context)
      throws IOException, InterruptedException {

    /*
     * TODO implement
     */
	  
	 int wordCount = 0;
	 
	 for(IntWritable value: values){
		 // add value to word count for each hit
		 wordCount += value.get();
	 }
	 context.write (key, new IntWritable(wordCount));

  }
}