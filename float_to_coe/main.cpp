#include <iostream>
#include <sstream>    //引入stringstream头文件
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <bits/stdc++.h>

using namespace std;

#define u8    unsigned char
#define u32   unsigned int

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

int main() {

    //write .coe file
    FILE *fid_write = fopen("sigmoid.coe","w");
    char T1[] = "MEMORY_INITIALIZATION_RADIX = 16;";
    char T2[] = "MEMORY_INITIALIZATION_VECTOR = ";
    if (fid_write == NULL)
        return 0;
    fprintf(fid_write,"%s\n",T1);
    fprintf(fid_write,"%s\n",T2);

    for (int i=-4096;i<4096;i++){
        float fa = 1.0/(1.0+exp(-(i/409.6)));cout<<fa<<" ";
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

        if(i==4096-1)
            fprintf(fid_write,"%s;\n",s.c_str());
        else
            fprintf(fid_write,"%s,\n",s.c_str());
    }
    fclose(fid_write);
}
