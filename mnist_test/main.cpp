#include <bits/stdc++.h>
#include <sstream>    //引入stringstream头文件
#include <stdio.h>
using namespace std ;

vector<double> labels_train;
vector<vector<double>> images_train;//训练集
vector<double> labels_test;
vector<vector<double>> images_test;//测试集
const double alpha = 0.014;

#define u8    unsigned char
#define u32   unsigned int
#define CONV1_O 5
#define CONV2_O 10

struct cnn_layer//定义卷积网络中的层，以及
{
    int L,W,C;
    //数据最大是30*30*64
    double data[30][30][64];
    double bias[64];
    double delta[30][30][64];
    void init()
    {
        for(int d1=0;d1<30;d1++)
            for(int d2=0;d2<30;d2++)
                for(int l=0;l<64;l++)
                    data[d1][d2][l] = 0.01 * (rand() % 100);  //可初始化卷积核
        for(int l=0;l<64;l++)
            bias[l] = 0.01;
    }
};
struct fcnn_layer//定义全连接网络中的层
{
    int L;
    //数据最大是4*4*64 10
    double data[1024];
    double bias[10];
    double delta[1024];
    double w[10][1024];
    //batch normalization
    double gamma, beta;
    double u, o2;
    double xhat[1024];
    double du;
    double do2;
    double dxhat[1024];
    void init()
    {
        for(int i=0;i<10;i++)
            for(int j=0;j<1024;j++) {
                w[i][j] = 0.01 * (rand() % 100);
                if(j==0)
                    bias[i] = 0.01;
            }
        gamma = 1.0;
        beta = 0.0;
    }
};

cnn_layer input_layer;
cnn_layer conv_layer1;
cnn_layer pool_layer1;
cnn_layer conv_layer2;
cnn_layer pool_layer2;
cnn_layer cnn_w1[CONV1_O];
cnn_layer cnn_w2[CONV2_O];
fcnn_layer fcnn_input1;
fcnn_layer fcnn_output;

/**************************此段为存储参数模块**************/
//参数1为原始数据，参数2为数组长度，参数三为转出来的字符串
void hex_to_asciistring(u8* str,u32 size,u8* str1)
{
    u8 deposit [2];
    int i=0;
    u8 j = 0;

    for(i=0;i<size;i++)
    {

        deposit[1] = str[i] & 0x0F;
        deposit[0] = (str[i] &0xF0) >> 4;
        for(j = 0; j < 2; j++)
        {
            switch(deposit[j])
            {
                case 0x00:
                    str1[i*2+j]='0';
                    break;
                case 0x01:
                    str1[i*2+j]='1';
                    break;
                case 0x02:
                    str1[i*2+j]='2';
                    break;
                case 0x03:
                    str1[i*2+j]='3';
                    break;
                case 0x04:
                    str1[i*2+j]='4';
                    break;
                case 0x05:
                    str1[i*2+j]='5';
                    break;
                case 0x06:
                    str1[i*2+j]='6';
                    break;
                case 0x07:
                    str1[i*2+j]='7';
                    break;
                case 0x08:
                    str1[i*2+j]='8';
                    break;
                case 0x09:
                    str1[i*2+j]='9';
                    break;
                case 0x0A:
                    str1[i*2+j]='A';
                    break;
                case 0x0B:
                    str1[i*2+j]='B';
                    break;
                case 0x0C:
                    str1[i*2+j]='C';
                    break;
                case 0x0D:
                    str1[i*2+j]='D';
                    break;
                case 0x0E:
                    str1[i*2+j]='E';
                    break;
                case 0x0F:
                    str1[i*2+j]='F';
                    break;
                default:
                    return ;
            }

        }

    }
    return ;
}

string float_to_hexString(float fa) {
    unsigned char farray[4] = {0};
    unsigned char farray2[4] = {0};
    unsigned char farray3[4];
    string s;

    *(float*)farray = fa;
    for(int i = 0; i < 4; i++)
        farray2[i] = farray[4-i-1];

    hex_to_asciistring(farray2, 4, farray3);

    for(int i = 0; i < 8; i++)
        s.push_back(farray3[i]);

    return s;
}

void write_coe()
{
    FILE *fid_write;
    string s;
    char T1[] = "MEMORY_INITIALIZATION_RADIX = 16;";
    char T2[] = "MEMORY_INITIALIZATION_VECTOR = ";

    //W1
    fid_write = fopen("W1.coe","w");
    fprintf(fid_write,"%s\n",T1);
    fprintf(fid_write,"%s\n",T2);

    for(int out_i=0; out_i<CONV1_O; out_i++)
        for(int c=0; c<cnn_w1[out_i].C; c++)
            for(int i=0; i<cnn_w1[out_i].L; i++)
                for(int j=0; j<cnn_w1[out_i].W; j++){
                    s = float_to_hexString((float)cnn_w1[out_i].data[i][j][c]);
                    if(out_i == CONV1_O-1 && c==cnn_w1[i].C-1 && i==cnn_w1[out_i].L-1 && j==cnn_w1[out_i].W-1)
                        fprintf(fid_write,"%s;\n",s.c_str());
                    else
                        fprintf(fid_write,"%s,\n",s.c_str());
                }
    fclose(fid_write);

    //b1
    fid_write = fopen("b1.coe","w");
    fprintf(fid_write,"%s\n",T1);
    fprintf(fid_write,"%s\n",T2);

    for(int out_i=0; out_i<CONV1_O; out_i++){
        s = float_to_hexString((float)conv_layer1.bias[out_i]);
        if(out_i == CONV1_O-1)
            fprintf(fid_write,"%s;\n",s.c_str());
        else
            fprintf(fid_write,"%s,\n",s.c_str());
    }
    fclose(fid_write);

    //W2
    fid_write = fopen("W2.coe","w");
    fprintf(fid_write,"%s\n",T1);
    fprintf(fid_write,"%s\n",T2);

    for(int out_i=0; out_i<CONV2_O; out_i++)
        for(int c=0; c<cnn_w2[out_i].C; c++)
            for(int i=0; i<cnn_w2[out_i].L; i++)
                for(int j=0; j<cnn_w2[out_i].W; j++){
                    s = float_to_hexString((float)cnn_w2[out_i].data[i][j][c]);
                    if(out_i == CONV2_O-1 && c==cnn_w2[i].C-1 && i==cnn_w2[out_i].L-1 && j==cnn_w2[out_i].W-1)
                        fprintf(fid_write,"%s;\n",s.c_str());
                    else
                        fprintf(fid_write,"%s,\n",s.c_str());
                }
    fclose(fid_write);

    //b2
    fid_write = fopen("b2.coe","w");
    fprintf(fid_write,"%s\n",T1);
    fprintf(fid_write,"%s\n",T2);

    for(int out_i=0; out_i<CONV2_O; out_i++){
        s = float_to_hexString((float)conv_layer2.bias[out_i]);
        if(out_i == CONV2_O-1)
            fprintf(fid_write,"%s;\n",s.c_str());
        else
            fprintf(fid_write,"%s,\n",s.c_str());
    }
    fclose(fid_write);

    //fcnn_W
    fid_write = fopen("fcnn_W.coe","w");
    fprintf(fid_write,"%s\n",T1);
    fprintf(fid_write,"%s\n",T2);

    for(int l=0; l<fcnn_input1.L; l++)
        for(int w=0; w<fcnn_output.L; w++){
            s = float_to_hexString((float)fcnn_input1.w[w][l]);
            if(l == fcnn_input1.L-1 && w==fcnn_output.L-1)
                fprintf(fid_write,"%s;\n",s.c_str());
            else
                fprintf(fid_write,"%s,\n",s.c_str());
        }
    fclose(fid_write);

    //fcnn_b
    fid_write = fopen("fcnn_b.coe","w");
    fprintf(fid_write,"%s\n",T1);
    fprintf(fid_write,"%s\n",T2);

    for(int w=0; w<fcnn_output.L; w++){
        s = float_to_hexString((float)fcnn_input1.bias[w]);
        if(w==fcnn_output.L-1)
            fprintf(fid_write,"%s;\n",s.c_str());
        else
            fprintf(fid_write,"%s,\n",s.c_str());
    }
    fclose(fid_write);

    //batch normalization
    fid_write = fopen("batch_normalization.coe","w");
    fprintf(fid_write,"%s\n",T1);
    fprintf(fid_write,"%s\n",T2);

    s = float_to_hexString((float)fcnn_input1.gamma);
    fprintf(fid_write,"%s,\n",s.c_str());
    s = float_to_hexString((float)fcnn_input1.beta);
    fprintf(fid_write,"%s,\n",s.c_str());
    s = float_to_hexString((float)fcnn_input1.u);
    fprintf(fid_write,"%s,\n",s.c_str());
    s = float_to_hexString((float)fcnn_input1.o2);
    fprintf(fid_write,"%s;\n",s.c_str());
    cout << "gamma: " << fcnn_input1.gamma << "; beta: " << fcnn_input1.beta << "; u: " << fcnn_input1.u << "; o2: " << fcnn_input1.o2 << "\n";
    fclose(fid_write);
}
/**************************此段为存储参数模块**************/

/**************************此段为读取MNIST数据集模块**************/
int ReverseInt(int i)
{
    unsigned char ch1, ch2, ch3, ch4;
    ch1 = i & 255;
    ch2 = (i >> 8) & 255;
    ch3 = (i >> 16) & 255;
    ch4 = (i >> 24) & 255;
    return((int)ch1 << 24) + ((int)ch2 << 16) + ((int)ch3 << 8) + ch4;
}
void read_Mnist_Label_train(string filename, vector<double>&labels)
{
    ifstream file;
    file.open(filename, ios::binary);
    if (file.is_open())
    {
        int magic_number = 0;
        int number_of_images = 0;
        file.read((char*)&magic_number, sizeof(magic_number));
        file.read((char*)&number_of_images, sizeof(number_of_images));
        magic_number = ReverseInt(magic_number);
        number_of_images = ReverseInt(number_of_images);
        for (int i = 0; i < number_of_images; i++)
        {
            unsigned char label = 0;
            file.read((char*)&label, sizeof(label));
            labels.push_back((double)label);
        }
    }
}
void read_Mnist_Images_train(string filename, vector<vector<double> >&images)
{
    ifstream file(filename, ios::binary);
    if (file.is_open())
    {
        int magic_number = 0;
        int number_of_images = 0;
        int n_rows = 0;
        int n_cols = 0;
        unsigned char label;
        file.read((char*)&magic_number, sizeof(magic_number));
        file.read((char*)&number_of_images, sizeof(number_of_images));
        file.read((char*)&n_rows, sizeof(n_rows));
        file.read((char*)&n_cols, sizeof(n_cols));
        magic_number = ReverseInt(magic_number);
        number_of_images = ReverseInt(number_of_images);
        n_rows = ReverseInt(n_rows);
        n_cols = ReverseInt(n_cols);
        for (int i = 0; i < number_of_images; i++)
        {
            vector<double>tp;
            for (int r = 0; r < n_rows; r++)
            {
                for (int c = 0; c < n_cols; c++)
                {
                    unsigned char image = 0;
                    file.read((char*)&image, sizeof(image));
                    tp.push_back(image);
                }
            }
            images.push_back(tp);
        }
    }
}
void read_Mnist_Label_test(string filename, vector<double>&labels)
{
    ifstream file;
    file.open(filename, ios::binary);
    if (file.is_open())
    {
        int magic_number = 0;
        int number_of_images = 0;
        file.read((char*)&magic_number, sizeof(magic_number));
        file.read((char*)&number_of_images, sizeof(number_of_images));
        magic_number = ReverseInt(magic_number);
        number_of_images = ReverseInt(number_of_images);
        for (int i = 0; i < number_of_images; i++)
        {
            unsigned char label = 0;
            file.read((char*)&label, sizeof(label));
            labels.push_back((double)label);
        }
    }
}
void read_Mnist_Images_test(string filename, vector<vector<double> >&images)
{
    ifstream file(filename, ios::binary);
    if (file.is_open())
    {
        int magic_number = 0;
        int number_of_images = 0;
        int n_rows = 0;
        int n_cols = 0;
        unsigned char label;
        file.read((char*)&magic_number, sizeof(magic_number));
        file.read((char*)&number_of_images, sizeof(number_of_images));
        file.read((char*)&n_rows, sizeof(n_rows));
        file.read((char*)&n_cols, sizeof(n_cols));

        magic_number = ReverseInt(magic_number);
        number_of_images = ReverseInt(number_of_images);

        n_rows = ReverseInt(n_rows);
        n_cols = ReverseInt(n_cols);
        for (int i = 0; i < number_of_images; i++)
        {
            vector<double>tp;
            for (int r = 0; r < n_rows; r++)
            {
                for (int c = 0; c < n_cols; c++)
                {
                    unsigned char image = 0;
                    file.read((char*)&image, sizeof(image));
                    tp.push_back(image);
                }
            }
            images.push_back(tp);
        }
    }
}

void weights_bias_init()
{
    input_layer.init();
    conv_layer1.init();
    pool_layer1.init();
    conv_layer2.init();
    pool_layer2.init();
    for(int i=0;i<CONV1_O;i++) cnn_w1[i].init();
    for(int i=0;i<CONV2_O;i++) cnn_w2[i].init();
    fcnn_input1.init();
    fcnn_output.init();

    input_layer.L = 28; input_layer.W = 28; input_layer.C = 1;
    for(int i=0; i<CONV1_O; i++){
        cnn_w1[i].L = 5; cnn_w1[i].W = 5; cnn_w1[i].C = 1;
    }
    conv_layer1.L = 24; conv_layer1.W = 24; conv_layer1.C = CONV1_O;
    pool_layer1.L = 12; pool_layer1.W = 12; pool_layer1.C = CONV1_O;
    for(int i=0; i<CONV2_O; i++){
        cnn_w2[i].L = 5; cnn_w2[i].W = 5; cnn_w2[i].C = CONV1_O;
    }
    conv_layer2.L = 8; conv_layer2.W = 8; conv_layer2.C = CONV2_O;
    pool_layer2.L = 4; pool_layer2.W = 4; pool_layer2.C = CONV2_O;

    //1--1
//    fcnn_input1.L = 12*12*CONV1_O;
    //1--2
    fcnn_input1.L = 4*4*CONV2_O;

    fcnn_output.L = 10;
}//权重初始化

void images_255to1()
{
    //测试数据集10000个
    for (int i = 0; i < images_test.size(); i++)
        //长度28*28=784的向量
        for (int j = 0; j < images_test[0].size(); j++)
            images_test[i][j]/=255.0;
    //训练数据集60000个
    for (int i = 0; i < images_train.size(); i++)
        //长度28*28=784的向量
        for (int j = 0; j < images_train[0].size(); j++)
            images_train[i][j]/=255.0;
}//图像归一化

/**************************************************************/

double sigmoid(double x)
{
    return 1.0/(1.0+exp(-x));
}
double Relu(double x)
{
    return max(0.0,x);
}
fcnn_layer softmax(fcnn_layer output)
{
    double sum=0.0; double maxx=-100000000;
    for(int i=0;i<output.L;i++) maxx=max(maxx,output.data[i]);
    for(int i=0;i<output.L;i++) sum+=exp(output.data[i]-maxx);
    for(int i=0;i<output.L;i++) output.data[i]=exp(output.data[i]-maxx)/sum;
    return output;
}

fcnn_layer BN(fcnn_layer x)
{
    //u
    x.u = 0;
    for(int i=0; i<x.L; i++)
        x.u += x.data[i];
    x.u = x.u / x.L;
    //o2
    x.o2 = 0;
    for(int i=0; i<x.L; i++)
        x.o2 += (x.data[i]-x.u)*(x.data[i]-x.u);
    x.o2 = x.o2 / x.L;
    //xhat
    for(int i=0; i<x.L; i++) {
        x.xhat[i] = (x.data[i] - x.u) / sqrt(x.o2 + 0.0001);
        x.data[i] = x.gamma * x.xhat[i] + x.beta;
    }
    return x;
}
fcnn_layer BN_back(fcnn_layer y)
{
    //dxhat, do2
    y.do2 = 0;
    for(int i=0; i<y.L; i++){
        y.dxhat[i] = y.delta[i] * y.gamma;
        y.do2 += y.dxhat[i] * (y.data[i] - y.u) * (-0.5/((y.o2+0.0001)*sqrt(y.o2+0.0001)));
    }
    //更新gamma
    double dgamma=0.0;
    for(int i=0; i<y.L; i++)
        dgamma += y.delta[i] * y.xhat[i];
    y.gamma -= alpha * dgamma;
    //更新beta
    double dbeta=0.0;
    for(int i=0; i<y.L; i++)
        dbeta += y.delta[i];
    y.beta -= alpha * dbeta;
    //du
    y.du = 0;
    for(int i=0; i<y.L; i++)
        y.du += (-(y.dxhat[i]/sqrt(y.o2+0.0001)) - (2*y.do2/y.L*(y.data[i]-y.u)));
    //dx
    for(int i=0; i<y.L; i++)
        y.delta[i] = y.dxhat[i]/sqrt(y.o2+0.0001) + y.do2*2/y.L*(y.data[i]-y.u) + y.du/y.L;
    //更新
    return y;
}
/**************************************************************/

//前向传播
cnn_layer CNN_Input(int num,cnn_layer input_image,int flag);//将图像输入卷积层
cnn_layer conv(cnn_layer input,cnn_layer conv_w[],int number,cnn_layer output);//卷积函数，表示卷积层A与number个filterB相卷积
cnn_layer maxpooling(cnn_layer conv_layer,cnn_layer pooling_layer);//池化前向输出
fcnn_layer Classify_input(cnn_layer cnn,fcnn_layer fcnn);//将卷积提取特征输入到全连接神经网络
fcnn_layer fcnn_Mul(fcnn_layer input,fcnn_layer output);//全连接层前向输出
//反向传播
cnn_layer pool_input(cnn_layer pooling_layer,fcnn_layer fcnn_layer);//全连接层的误差项传递到CNN中
cnn_layer pool_delta(cnn_layer conv_layer,cnn_layer pooling_layer);//当前层为池化层的敏感项传递
cnn_layer conv_dXupdate(cnn_layer conv_w[], cnn_layer input, cnn_layer output);
cnn_layer conv_dWdbupdate(cnn_layer conv_w, cnn_layer input, cnn_layer output);//filter更新

double dLdb(cnn_layer output, int channel);//矩阵求和，此处用于敏感项求和
double dLdW(cnn_layer output,cnn_layer input,int conv_l,int conv_w,int conv_c);
double dLdX(cnn_layer output,cnn_layer conv_W,int input_l,int input_w,int input_c, int output_c);

//前向传播
cnn_layer CNN_Input(int num,cnn_layer input_image,int flag)
{
    int x=0;

    for(int i=0;i<input_image.L;i++)
        for(int j=0;j<input_image.W;j++)
            for(int k=0;k<input_image.C;k++)
            {
                if(flag==0) input_image.data[i][j][k]=images_train[num][x];
                else if(flag==1) input_image.data[i][j][k]=images_test[num][x];
                x++;
            }

    return input_image;
}

cnn_layer conv(cnn_layer input,cnn_layer conv_w[],int number,cnn_layer output)
{
    memset(output.data,0,sizeof(output.data));

    for(int num=0;num<number;num++)
        for(int i=0;i<input.L;i++)
            for(int j=0;j<input.W;j++)
            {
                for(int k=0;k<conv_w[0].C;k++)
                    for(int a=0;a<conv_w[0].L;a++)
                        for(int b=0;b<conv_w[0].W;b++)
                            output.data[i][j][num] += input.data[i+a][j+b][k] * conv_w[num].data[a][b][k];
                output.data[i][j][num] = Relu(output.data[i][j][num]+output.bias[num]);
            }
    return output;
}

cnn_layer maxpooling(cnn_layer conv_layer,cnn_layer pooling_layer)
{
    for(int k=0;k<conv_layer.C;k++)
        for(int i=0;i<conv_layer.L;i+=2)
            for(int j=0;j<conv_layer.W;j+=2)
                pooling_layer.data[i/2][j/2][k] = max(max(conv_layer.data[i][j][k],conv_layer.data[i+1][j][k]),
                                                    max(conv_layer.data[i][j+1][k],conv_layer.data[i+1][j+1][k]));
    return pooling_layer;
}

fcnn_layer Classify_input(cnn_layer cnn,fcnn_layer fcnn)
{
    int x=0;

    for(int k=0;k<cnn.C;k++)
        for(int i=0;i<cnn.L;i++)
            for(int j=0;j<cnn.W;j++){
                fcnn.data[x] = cnn.data[i][j][k];
                x++;
            }
    return fcnn;
}

fcnn_layer fcnn_Mul(fcnn_layer input,fcnn_layer output)
{
    memset(output.data,0,sizeof(output.data));

    for(int i=0;i<output.L;i++){
        for(int j=0;j<input.L;j++)
            output.data[i] += input.w[i][j]*input.data[j];
        output.data[i] += input.bias[i];
    }
    return output;
}

//反向传播
cnn_layer pool_input(cnn_layer pooling_layer,fcnn_layer fcnn_layer)
{
    int x=0;
    for(int k=0;k<pooling_layer.C;k++)
        for(int i=0;i<pooling_layer.L;i++)
            for(int j=0;j<pooling_layer.W;j++){
                pooling_layer.delta[i][j][k] = fcnn_layer.delta[x];
                x++;
            }
    return pooling_layer;
}

cnn_layer pool_delta(cnn_layer conv_layer,cnn_layer pooling_layer)
{
    for(int k=0;k<conv_layer.C;k++)
        for(int i=0;i<conv_layer.L;i+=2)
            for(int j=0;j<conv_layer.W;j+=2){
                if(fabs(conv_layer.data[i][j][k]-pooling_layer.data[i/2][j/2][k])<0.01)
                    conv_layer.delta[i][j][k] = pooling_layer.delta[i/2][j/2][k];
                else
                    conv_layer.delta[i][j][k] = 0;
            }
    return conv_layer;
}

double dLdX(cnn_layer output,cnn_layer conv_W,int input_l,int input_w,int input_c, int output_c) //delta_l-1 = dL/dX = ∑(delta_l(pad)*rot180(W_l))
{
    double a=0;
    for(int i=0;i<conv_W.L;i++)
        for(int j=0;j<conv_W.W;j++)
             a += output.delta[input_l+i][input_w+j][output_c]*conv_W.data[conv_W.L-1-i][conv_W.W-1-j][input_c];
    return a;
}
cnn_layer conv_dXupdate(cnn_layer conv_w[], cnn_layer input, cnn_layer output) //delta_l-1 = dL/dX = ∑(delta_l(pad)*rot180(W_l))  delta_l = cnn_w2
{
    //add pad to delta_l
    cnn_layer temp_output;
    int pad = 4; //conv_w[0].L-1;
    for(int k=0;k<output.C;k++)
        for(int i=0;i<output.L+2*pad;i++)
            for(int j=0;j<output.W+2*pad;j++){
                if((i>=pad and i<output.L+pad) and (j>=pad and j<output.W+pad)) temp_output.delta[i][j][k] = output.delta[i-pad][j-pad][k];
                else temp_output.delta[i][j][k] = 0.0;
            }
    //delta_l-1
    double lx;
    for(int k=0;k<input.C;k++)
        for(int i=0;i<input.L;i++)
            for(int j=0;j<input.W;j++){
                lx = 0;
                for(int o=0;o<output.C;o++) lx += dLdX(temp_output,conv_w[o],i,j,k,o);
                //d(Relu)
                if(input.data[i][j][k] < 0) input.delta[i][j][k] = 0.0;
                else input.delta[i][j][k] = lx;
            }
    return input;
}

double dLdb(cnn_layer output, int channel) //dL/db = ∑delta_l
{
    double a=0;
    for(int i=0;i<output.L;i++)
        for(int j=0;j<output.W;j++)
             a += output.delta[i][j][channel];
    return a;
}
double dLdW(cnn_layer output,cnn_layer input,int conv_l,int conv_w,int conv_c) //dL/dW = ∑(z_l-1*delta_l)
{
    double a=0;
    for(int k=0;k<output.C;k++)
        for(int i=0;i<output.L;i++)
            for(int j=0;j<output.W;j++)
                a += output.delta[i][j][k]*input.data[i+conv_l][j+conv_w][conv_c];
    return a;
}
cnn_layer conv_dWdbupdate(cnn_layer conv_w, cnn_layer input, cnn_layer output)
{
    //W
    for(int k=0;k<conv_w.C;k++)
        for(int i=0;i<conv_w.L;i++)
            for(int j=0;j<conv_w.W;j++)
                conv_w.data[i][j][k] -= alpha*dLdW(output,input,i,j,k); //dL/dW = ∑(z_l-1*delta_l); W_l-1 = W_l + alpha*dL/dW
    //b
    for(int k=0;k<output.C;k++)
        output.bias[k] -= alpha*dLdb(output, k); //dL/db = ∑delta_l, b_l-1 = b_l + alpha*dL/db

    return conv_w;
}

void forward_propagation(int num,int flag)//做一次前向输出
{
    input_layer = CNN_Input(num, input_layer, flag);
    conv_layer1 = conv(input_layer, cnn_w1, CONV1_O, conv_layer1);
    pool_layer1 = maxpooling(conv_layer1, pool_layer1);
    conv_layer2 = conv(pool_layer1, cnn_w2, CONV2_O, conv_layer2);
    pool_layer2 = maxpooling(conv_layer2, pool_layer2);

    //2--1
//    fcnn_input1 = Classify_input(pool_layer1, fcnn_input1);
    //2--2
    fcnn_input1 = Classify_input(pool_layer2, fcnn_input1);
    fcnn_input1 = BN(fcnn_input1);

    for(int i=0;i<fcnn_input1.L;i++)
        fcnn_input1.data[i] = sigmoid(fcnn_input1.data[i]);

    fcnn_output = fcnn_Mul(fcnn_input1, fcnn_output);
    fcnn_output = softmax(fcnn_output);

    for(int i=0;i<fcnn_output.L;i++)
    {   //d(softmax)
        if(i==(int)labels_train[num])
            fcnn_output.delta[i] = fcnn_output.data[i]-1.0;
        else
            fcnn_output.delta[i] = fcnn_output.data[i];
    }
}
void back_propagation()//反向传播算法
{
    memset(fcnn_input1.delta,0,sizeof(fcnn_input1.delta));

    //全连接层
    for(int i=0;i<fcnn_input1.L;i++)
        for(int j=0;j<fcnn_output.L;j++){
            fcnn_input1.w[j][i] -= alpha*fcnn_output.delta[j] * fcnn_input1.data[i];
            fcnn_input1.bias[j] -= alpha*fcnn_output.delta[j];
        }

    for(int i=0;i<fcnn_input1.L;i++)
        for(int j=0;j<fcnn_output.L;j++)
            fcnn_input1.delta[i] += fcnn_input1.w[j][i] * fcnn_output.delta[j];

    //d(sigmoid)
    for(int i=0;i<fcnn_input1.L;i++)
        fcnn_input1.delta[i] = fcnn_input1.data[i] * (1.0-fcnn_input1.data[i]) * fcnn_input1.delta[i];
    fcnn_input1 = BN_back(fcnn_input1);

    //3--1
    //转换格式
//    pool_layer1 = pool_input(pool_layer1, fcnn_input1);
//    //池化层1
//    conv_layer1 = pool_delta(conv_layer1, pool_layer1);//pooling误差传递
//    //卷积层1
//    for(int i=0;i<conv_layer1.C;i++)
//        cnn_w1[i] = conv_dWdbupdate(cnn_w1[i],input_layer,conv_layer1);

    //3--2
    //转换格式
    pool_layer2 = pool_input(pool_layer2, fcnn_input1);
    //池化层2
    conv_layer2 = pool_delta(conv_layer2, pool_layer2);//pooling误差传递
    //卷积层2
    pool_layer1 = conv_dXupdate(cnn_w2,pool_layer1,conv_layer2);
    for(int i=0;i<conv_layer2.C;i++)  //CONV2_O
        cnn_w2[i] = conv_dWdbupdate(cnn_w2[i],pool_layer1,conv_layer2);
    //池化层1
    conv_layer1 = pool_delta(conv_layer1, pool_layer1);//pooling误差传递
    //卷积层1
    for(int i=0;i<conv_layer1.C;i++)  //CONV1_O
        cnn_w1[i] = conv_dWdbupdate(cnn_w1[i],input_layer,conv_layer1);
}

void train(int time)
{
    double err=0;

    //all data
    for(int i=0;i<20000;i++)
    {   //batch
        //for(int j=0; j<100; j++) {
        forward_propagation(i,0);
        //}
        err-=log(fcnn_output.data[(int)labels_train[i]]);
        if(i%2000 == 0){
            printf("err: %.3f\n",log(fcnn_output.data[(int)labels_train[i]]));
            for(int j=0; j<10; j++){
                printf("%.5f ",fcnn_output.data[j]);
            }
            printf(" %.0f\n",labels_train[i]);
        }
        back_propagation();
    }
    //printf("step: %d   loss:%.5f\n",time,1.0*err/20000);//每次记录一遍数据集的平均误差
}
void test(int time)
{
    int sum=0;
    for(int i=0;i<10000;i++)
    {
        forward_propagation(i,1);
        int ans=-1;
        double sign=-1;
        for(int j=0;j<10;j++)
            if(fcnn_output.data[j]>sign){
                sign = fcnn_output.data[j];
                ans = j;
            }
        int label=int(labels_test[i]);
        if(ans==label) sum++;
    }
    printf("step:%d   precision: %.5f\n",time,1.0*sum/10000);
}

int main()
{
    weights_bias_init(); //W，b初始化

    read_Mnist_Label_train("../src/train-labels.idx1-ubyte", labels_train);
    read_Mnist_Images_train("../src/train-images.idx3-ubyte", images_train);//读取mnist训练数据集
    read_Mnist_Label_test("../src/t10k-labels.idx1-ubyte", labels_test);
    read_Mnist_Images_test("../src/t10k-images.idx3-ubyte", images_test);//读取mnist测试数据集

    images_255to1(); //图像归一化

    //训练若干次，预写为50次epoch
    for(int time=0; time<50; time++){
        //训练
        train(time);
        //测试
        test(time);
    }

    write_coe();  //保存参数

    return 0;
}
