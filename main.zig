const std=@import("std");
const glfw=@cImport({
    @cInclude("GLFW/glfw3.h");
    @cInclude("GLFW/glfw3native.h");
});
const gl=@cImport({
    @cInclude("GL/gl.h");
});

pub fn main() !void {
    if (glfw.glfwInit() == 0) {
        std.debug.print("GLFW 初始化失败", .{});
        return;
    }

    const window:?*glfw.GLFWwindow = glfw.glfwCreateWindow(200, 200, "glfw binding", null, null);
    if (window == null) {
        glfw.glfwTerminate();
        std.debug.print("窗口创建失败", .{});
        return;
    }

    glfw.glfwMakeContextCurrent(window);

    while (glfw.glfwWindowShouldClose(window) == 0) {
        // 渲染代码
        glfw.glfwSwapBuffers(window);
        glfw.glfwPollEvents();
    }

    glfw.glfwDestroyWindow(window);
    glfw.glfwTerminate();
}