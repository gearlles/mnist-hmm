using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mnist_hmm
{
    public class MnistReader
    {
        public static List<DigitImage> Read(string labelsFile, string imagesFile)
        {
            List<DigitImage> images = new List<DigitImage>();
            try
            {
                Console.WriteLine("\nBegin\n");
                FileStream ifsLabels = new FileStream(@"C:\t10k-labels.idx1-ubyte", FileMode.Open); // test labels
                FileStream ifsImages = new FileStream(@"C:\t10k-images.idx3-ubyte", FileMode.Open); // test images

                BinaryReader brLabels = new BinaryReader(ifsLabels);
                BinaryReader brImages = new BinaryReader(ifsImages);

                int magic1 = brImages.ReadInt32(); // discard
                int numImages = brImages.ReadInt32();
                int numRows = brImages.ReadInt32();
                int numCols = brImages.ReadInt32();

                int magic2 = brLabels.ReadInt32();
                int numLabels = brLabels.ReadInt32();

                byte[][] pixels = new byte[28][];
                for (int i = 0; i < pixels.Length; ++i)
                    pixels[i] = new byte[28];

                // each test image
                for (int di = 0; di < 10000; ++di)
                {
                    for (int i = 0; i < 28; ++i)
                    {
                        for (int j = 0; j < 28; ++j)
                        {
                            byte b = brImages.ReadByte();
                            pixels[i][j] = b;
                        }
                    }

                    byte lbl = brLabels.ReadByte();

                    DigitImage dImage = new DigitImage(pixels, lbl);
                    Console.WriteLine(dImage.ToString());
                    Console.ReadLine();
                } // each image

                ifsImages.Close();
                brImages.Close();
                ifsLabels.Close();
                brLabels.Close();

                Console.WriteLine("\nEnd\n");
                Console.ReadLine();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                Console.ReadLine();
            }
            return images;
        }
    }
}
