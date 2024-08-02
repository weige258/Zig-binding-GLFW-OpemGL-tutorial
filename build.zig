const std=@import("std");

pub fn build(b:*std.Build) void{
    //standard build step
    const target=b.standardTargetOptions(.{});
    const optimize=b.standardOptimizeOption(.{});
    const exe=b.addExecutable(.{
        .name = "main",
        .root_source_file = b.path("./main.zig"),
        .target = target,
        .optimize = optimize,
    });
    //link glfw include path and lib path
    exe.addIncludePath(b.path("./include/"));
    exe.addLibraryPath(b.path("./lib-static-ucrt/"));
    //link windows system libs 
    exe.linkSystemLibrary("glfw3dll");
    exe.linkSystemLibrary("opengl32");
    exe.linkSystemLibrary("gdi32");
    //link c standard librarys
    exe.linkLibC();
    //build exe 
    b.installArtifact(exe);
}