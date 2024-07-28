const std = @import("std");

pub fn main() !void {
    // The `unreachable` keyword is used to indicate code paths that should
    // never be executed. If such a path is taken, it signals a logical error
    // or an unexpected environment state.
    const file = std.fs.cwd().openFile("does not exist", .{}) catch unreachable;
    _ = file;
}
