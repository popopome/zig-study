const std = @import("std");
const assert = std.debug.assert;

// A function whose name starts with a capital letter indicates that it returns
// a type.
fn List(comptime T: type) type {
    return struct {
        items: []T,
        len: usize,
    };
}

pub fn main() void {
    var buffer: [10]i32 = undefined;
    var list = List(i32){
        .items = &buffer,
        .len = 0,
    };

    list.items[0] = 1234;
    list.len += 1;

    std.debug.print("{d}\n", .{list.items.len});
}

test "types are values" {
    const T1 = u8;
    const T2 = bool;

    // Types are actually values which can be compared to each other.
    assert(T1 != T2);

    const x: T2 = true;
    assert(x);
}
