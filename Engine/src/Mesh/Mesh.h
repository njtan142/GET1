#pragma once
#include <glad/glad.h>

namespace Bengine {

	class Quad {
    public:
        float vertices[12] = {
         0.5f,  0.5f, 0.0f,  // top right
         0.5f, -0.5f, 0.0f,  // bottom right
        -0.5f, -0.5f, 0.0f,  // bottom left
        -0.5f,  0.5f, 0.0f   // top left 
        };
        unsigned int indices[6] = {  // note that we start from 0!
            0, 1, 3,  // first Triangle
            1, 2, 3   // second Triangle
        };
	};

    class Triangle {
    public:
        float vertices[9] = {
             0.0f,  0.5f,  0.0f,
            -0.5f, -0.5f,  0.0f,
             0.5f, -0.5f,  0.0f
        };
        unsigned int indices[3] = {
            0, 1, 2
        };
    };




}