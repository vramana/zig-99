const std = @import("std");

const List = struct {
    value: u8,
    next: ?*List,
};

fn lastElement(list: List) u8 {
    if (list.next) |nextList| {
        return lastElement(nextList.*);
    }

    return list.value;
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}!\n", .{"worlddd"});
}

test "listTest" {
    var a = List{ .value = 3, .next = null };
    var b = List{ .value = 3, .next = &a };

    try std.testing.expect(lastElement(b) == 3);
}
