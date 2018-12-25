/* Design and develop a distributed application to find the hottest year from the available
   weather data. Use weather data from the Internet and process it using MapReduce.

*/


import java.io.IOException;
import java.util.Iterator;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.conf.Configuration;

public class MyMax {

	public static class MaxTemperatureMapper extends
			Mapper<LongWritable, Text, Text, FloatWritable> {	
		@Override
		public void map(LongWritable arg0, Text Value, Context context)
				throws IOException, InterruptedException {
			float max_temp = -50, min_temp = 100;
			String line = Value.toString();

			if (!(line.length() == 0)) {				
				//date				
				String date = line.substring(6, 14);
				String year = line.substring(6, 10);
				//maximum temperature				
				float temp_Max = Float.parseFloat(line.substring(39, 45).trim());			

				//if maximum temperature is greater than 35 , its a hot day				
				if (temp_Max > max_temp && temp_Max < 100) 
					context.write(new Text("Hot Day of " + year + " is: "),new FloatWritable(temp_Max));
			}
		}
	}

	public static class MaxTemperatureReducer extends
			Reducer<Text, FloatWritable, Text, FloatWritable> {

		public void reduce(Text key, Iterable<FloatWritable> values, Context context)
				throws IOException, InterruptedException {	

			float max = -100;
			for (FloatWritable val : values) {      	
					if(val.get() > max)		
						max = val.get();
        	}
			context.write(key, new FloatWritable(max));
		}
	}

	public static void main(String[] args) throws Exception {
		Configuration conf = new Configuration();	
		Job job = new Job(conf, "Hottest Years");	
		job.setJarByClass(MyMax.class);
		job.setMapOutputKeyClass(Text.class);	
		job.setMapOutputValueClass(FloatWritable.class);
		job.setMapperClass(MaxTemperatureMapper.class);	
		job.setReducerClass(MaxTemperatureReducer.class);
		job.setInputFormatClass(TextInputFormat.class);	
		job.setOutputFormatClass(TextOutputFormat.class);
		Path OutputPath = new Path(args[1]);
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		OutputPath.getFileSystem(conf).delete(OutputPath);
		System.exit(job.waitForCompletion(true) ? 0 : 1);

	}
}

