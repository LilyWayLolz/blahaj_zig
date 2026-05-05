const exe = b.addExecutable(.{
    .name = "beluga",
    .root_source_file = b.path("src/main.zig"),
    .target = target,
    // just a suggestion, use .ReleaseSafe
    .optimize = optimize,
    // must always be on, hard dependency
    .link_libc = true,
    // self-hosted backed is unstable as of today 2025-05-16, 
    .use_llvm = true,
});

const dzig = b.dependency("discordzig", .{});

exe.root_module.addImport("discord.zig", dzig.module("discord.zig"));