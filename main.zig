const std = @import("std");

const infered_const = 89.89;

const constant: i32 = 5;
var variable: u32 = 9999;

const a: u8 = undefined;

const infered_again = @as(i32, 987);

const infered_char_list = "hello world";

const multi_line_str_literal =
    \\this is a multiline string literal;
    \\it can span various lines
    ;

const arr_literal_with_length = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
const initialisation_using_result_location : [5]u8 = .{ 'h', 'e', 'l', 'l', 'o' };
const arr = [5]i8;

const array_literal_initialisation = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

const arr_len = arr.len;

const concated_arr =  arr_literal_with_length ++ " " ++ array_literal_initialisation  ;

fn add(x :i8, y: i8) i8{
    if (x == 0) {
        return y;
    }
    return x + y;
}

export fn extern_add(x :i8, y: i8) i8{
    if (x == 0) {
        return y;
    }
    return x + y;
}

const Point = struct {
    x: f32,
    y: f32,
};

const Point2 = packed struct {
    x: f32,
    y: f32,
};

const p = Point{
    .x = 0.860,
    .y = 0.342
};

const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn init(x: f32, y: f32, z: f32) Vec3 {
        return Vec3 {
            .x = x,
            .y = y,
            .z = z,
        };
    }

    pub fn dot(self: Vec3, other: Vec3) f32 {
        return self.x * other.x + self.y * other.y + self.z * other.z;
    }
};

test "dot product" {
    const expect = @import("std").testing.expect;
    const v1 = Vec3.init(1.0, 0.0, 0.0);
    const v2 = Vec3.init(0.0, 1.0, 0.0);

    try expect(Vec3.dot(v1, v2) == 0.0);
}

const Empty = struct {
    pub const PI = 3.14;
};

pub fn main() void {
    var sum :u16 = 0;
    for(arr_literal_with_length) |_u8_val| {
        sum += @as(u16, _u8_val);
    }
    std.debug.print("{s}\n", .{concated_arr});
}
