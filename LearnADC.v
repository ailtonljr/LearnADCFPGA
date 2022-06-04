module LearnADC (CLOCK_50, KEY, SW, LED, ADC_SCLK,
						ADC_CS_N, ADC_SDAT, ADC_SADDR);
	input CLOCK_50;
	input [0:0] KEY;
	input [2:0] SW;
	output [7:0] LED;

	input ADC_SDAT;
	output ADC_SCLK, ADC_CS_N, ADC_SADDR;

	wire [11:0] values [7:0];

	assign LED = values [SW] [11:4];
	simpleadc SimpleADC (
		.CLOCK (CLOCK_50),
		.RESET (KEY[0]),
		.ADC_SCLK (ADC_SCLK),
		.ADC_CS_N (ADC_CS_N),
		.ADC_DOUT (ADC_SDAT),
		.ADC_DIN (ADC_SADDR),
		.CH0 (values[0]),
		.CH1 (values[1]),
		.CH2 (values[2]),
		.CH3 (values[3]),
		.CH4 (values[4]),
		.CH5 (values[5]),
		.CH6 (values[6]),
		.CH7 (values[7])
	);
endmodule