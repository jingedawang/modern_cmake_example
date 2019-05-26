#include "my_library/my_library.h"
#include <iostream>
#include "opencv2/opencv.hpp"

void sayHello() {
    cv::Mat mat;
    std::cout << "I have created a cv::Mat with type " << mat.type() << std::endl;
}