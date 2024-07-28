const std = @import("std");

fn parseInt(buf: []const u8, radix: u8) !u64 {
    var sum: u64 = 0;
    for (buf) |c| {
        const digit = try charToDigit(c);
        if (digit >= radix) {
            return error.DigitExceedsRadix;
        }
        sum = try std.math.mul(u64, sum, radix);
        sum = try std.math.add(u64, sum, digit);
    }

    return sum;
}

fn charToDigit(c: u8) !u64 {
    return switch (c) {
        '0'...'9' => c - '0',
        'A'...'Z' => c - 'A' + 10,
        'a'...'z' => c - 'a' + 10,
        else => return error.InvalidCharacter,
    };
}

pub fn main() !void {}

test "cases" {
    try std.testing.expectEqual(100, parseInt("100", 10));
    try std.testing.expectEqual(100, parseInt("64", 16));
    try std.testing.expectEqual(255, parseInt("FF", 16));
}
