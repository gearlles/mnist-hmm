using Accord.Statistics.Models.Markov;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mnist_hmm
{
    public class MnistTrainer
    {
        private List<DigitImage> trainData;
        private List<DigitImage> testData;

        private List<HiddenMarkovModel> hmms;

        public void ReadData()
        {
            trainData = MnistReader.Read(Properties.Settings.Default.TrainLabels, Properties.Settings.Default.TrainImages);
            testData = MnistReader.Read(Properties.Settings.Default.TestLabels, Properties.Settings.Default.TestImages);
        }

        public void Train()
        {
            HiddenMarkovModel hmm = new HiddenMarkovModel(3, 2);
        }
    }
}
