//plug pmod-led on PMOD2

module i2cpwm (
    input           clk, 
    output          led, 
    output [7:0]    leds, 
    inout           scl, 
    inout           sda
);
      
    reg [31:0] counter;
    wire pwm_clock = counter[8];

    reg [7:0] value[8];

    assign led = counter[21];

    initial begin
        led_status = 0;
        value[0] = 1;
        value[1] = 20;
        value[2] = 40;
        value[3] = 60;
        value[4] = 80;
        value[5] = 100;
        value[6] = 200;
        value[7] = 255;
    end

    pwm_module pwm0 (
        .clk(pwm_clock), 
        .value(value[0]), 
        .pulse(leds[0])
    );

    pwm_module pwm1 (
        .clk(pwm_clock), 
        .value(value[1]), 
        .pulse(leds[1])
    );

    pwm_module pwm2 (
        .clk(pwm_clock), 
        .value(value[2]), 
        .pulse(leds[2])
    );

    pwm_module pwm3 (
        .clk(pwm_clock), 
        .value(value[3]), 
        .pulse(leds[3])
    );

    pwm_module pwm4 (
        .clk(pwm_clock), 
        .value(value[4]), 
        .pulse(leds[4])
    );

    pwm_module pwm5 (
        .clk(pwm_clock), 
        .value(value[5]), 
        .pulse(leds[5])
    );

    pwm_module pwm6 (
        .clk(pwm_clock), 
        .value(value[6]), 
        .pulse(leds[6])
    );

    pwm_module pwm7 (
        .clk(pwm_clock), 
        .value(value[7]), 
        .pulse(leds[7])
    );

    always @(posedge clk)
    begin
        counter <= counter + 1;
    end

//    always @(posedge lclk)
//    begin
//        LED <= {LED[6:0], LED[7]};
//    end

endmodule