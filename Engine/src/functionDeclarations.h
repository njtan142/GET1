#pragma once
#include <GLFW/glfw3.h>

void framebuffer_size_callback(GLFWwindow* window, int width, int height);
void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods);
void loadTexture(const char* path, unsigned int colorType);
void setTextureParam(GLenum target, GLint wrapMode, GLint filterMode);

