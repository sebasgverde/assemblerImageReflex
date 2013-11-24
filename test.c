#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <cv.h>
#include <highgui.h>
 
 //char *argv[3];

 //argv[1] = "images.jpg"
 //argv[2] = "nueva.jpg";

IplImage* devStruct(char* origen)
{
  IplImage* img = 0;
 
  // load an image
  img=cvLoadImage(origen,1);
  if(!img){
    printf("Could not load image file:\n");
    exit(0);
  }

  return img;
}

void invertir(int height, int width,int channels, int step, uchar * data)
{
  int i,j,k;
  printf("Processing a %dx%d image with %d channels with step %d\n",height,width,channels,step);


  // invert the image
  for(i=0;i<height;i++)
     for(j=0;j<width/2;j++)
        for(k=0;k<channels;k++)  //loop to read for each channel
           {
            int temp =data[i*step+j*channels+k];
            data[i*step+j*channels+k]=data[i*step+(step-j*channels)+k];    //inverting the image
            data[i*step+(step-j*channels)+k]= temp;
           }
 }

 int dividir(int width)
 {
  return width/2;
 }

void dibujar(char* destino, IplImage* img)
{
    // create a window
  cvNamedWindow(destino, CV_WINDOW_AUTOSIZE);
  cvMoveWindow(destino, 100, 100);    // to move the window to position 100 100.
 
   // show the image
  
    int p[3];

    p[0] = CV_IMWRITE_JPEG_QUALITY;
    p[1] = 10;
    p[2] = 0;


  cvSaveImage(destino,img,p);
  cvShowImage(destino, img );
 
  // wait for a key
  cvWaitKey(0);
 
  // release the image
  cvReleaseImage(&img );
  cvDestroyWindow(destino);
}