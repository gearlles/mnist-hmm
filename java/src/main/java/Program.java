import be.ac.ulg.montefiore.run.jahmm.*;
import be.ac.ulg.montefiore.run.jahmm.learn.BaumWelchLearner;
import be.ac.ulg.montefiore.run.jahmm.learn.BaumWelchScaledLearner;
import be.ac.ulg.montefiore.run.jahmm.toolbox.MarkovGenerator;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Felipe on 24/11/2015.
 */
public class Program
{
    public static void main(String args[]) throws IOException
    {
        MnistManager train = new MnistManager("C:\\datasets\\mnist\\train-images-idx3-ubyte","C:\\datasets\\mnist\\train-labels-idx1-ubyte");

        int numberOfEntries = 256;
        int numberOfStates = 11;
        Hmm<ObservationReal> hmm = new Hmm<ObservationReal>(numberOfStates, new OpdfGaussianFactory());
        System.out.println(hmm);
        BaumWelchScaledLearner learner = new BaumWelchScaledLearner();

        List<List<List<ObservationReal>>> allSequences = generateObservations(train);
        List<List<ObservationReal>> observations = allSequences.get(0);
        //learner.setNbIterations(20);
        Hmm<ObservationReal>[] hmmR = new Hmm[10];
        for(int i =0; i < 10; i ++)
        {
            hmmR[i] = learner.learn(hmm, allSequences.get(i));
        }
        //Hmm<ObservationReal> hmm2 = learner.learn(hmm, observations);
        //Hmm<ObservationReal> hmm2 = learner.iterate(hmm, observations);
        //System.out.println(hmm2);
        System.out.println(hmm);
        //System.out.println(hmm2);

        //List<ObservationInteger> sequence = gen.observationSequence(10)

        int right = 0;
        for(int i = 0 ; i < 10; i++)
        {
            double probability[] = new double[10];

            int total = 0;

            for(int j = 0 ; j < allSequences.get(i).size(); j++)
            {
                double max = Double.MIN_VALUE;
                int index = 0;
                for(int k = 0; k < 10; k++ )
                {
                    double probability1 = hmmR[k].probability(allSequences.get(i).get(j));
                    probability[k] += probability1;
                    if(probability1  > max)
                    {
                        max = probability1;
                        index = k;
                    }
                }
                if(index == i)
                {
                    right++;
                }
                total++;
            }
            for(int k = 0; k < 10; k++ )
            {
                System.out.println(i +" "+ k+ ": " + probability[k] / total);
            }
        }
        System.out.println(right/1000.0);



    }

    private static List<List<List<ObservationReal>>> generateObservations(MnistManager train) throws IOException
    {
        MnistImageFile images = train.getImages();
        MnistLabelFile labels = train.getLabels();
        List<List<List<ObservationReal>>> allSequences = new ArrayList<List<List<ObservationReal>>>();

        for(int i = 0 ; i < 10; i++)allSequences.add(new ArrayList<List<ObservationReal>>());

        for (int j = 0; j < 1000/*labels.getCount()*/; j++)
        {
            List<List<ObservationReal>> destinySequence = allSequences.get(labels.readLabel());

            List<ObservationReal> sequence = new ArrayList<ObservationReal>();
            int[][] image = images.readImage();
            for (int x = 0; x < image.length; x++)
            {
                for (int y = 0; y < image[x].length; y++)
                {
                    sequence.add(new ObservationReal(image[x][y]/255.0));// / 255.0));
                }
            }

            destinySequence.add(sequence);
            //labels.next();
        }

        for(int i = 0 ; i < 10; i++) System.out.println(allSequences.get(i).size());

        return allSequences;
    }
}
