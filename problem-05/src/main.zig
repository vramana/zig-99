const std = @import("std");

const List = struct {
    value: u8,
    next: ?*List,
};

fn reverse(list: *List) ?*List {
    var prev: ?*List = null;
    var tmp: ?*List = list;
    var next: ?*List = null;

    while (tmp) |t| {
        next = t.next;
        t.next = prev;
        prev = t;
        tmp = next;
    }
    return prev;
}

fn print(list: ?*List) void {
    var tmp = list;
    while (tmp) |node| {
        std.debug.print("Value: {}\n", .{node.value});
        tmp = node.next;
    }
}

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)

    var a = List{ .value = 3, .next = null };
    var b = List{ .value = 4, .next = &a };
    var c = List{ .value = 5, .next = &b };
    var d = List{ .value = 6, .next = &c };

    var e = reverse(&d);
    print(e.?);
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
