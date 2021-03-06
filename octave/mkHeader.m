function [] = mkHeader(steps, formatHeight, formatWidth) 
	points = compute(65536);
	ords = round([1 : 65536 / steps : 65536]);
	points = points(ords);
	fid = fopen("gamma.h", "w");
	fprintf(fid, "// This file is automatically generated by octave\n");
	fprintf(fid, "// Command issued: mkHeader(%d, %d, %d)\n", steps, formatHeight, formatWidth);
	fprintf(fid, "#ifndef GAMMMA_CORRECTION_H_D\n");
	fprintf(fid, "#define GAMMMA_CORRECTION_H_D\n");
	fprintf(fid, "\n");
	fprintf(fid, "const uint16_t gammaValues[] PROGMEM = {\n");
	count = 1;
	for i = 1 : formatHeight
		fprintf(fid, "\t");
		for j = 1 : formatWidth
			fprintf(fid, "%d, ", points(count));
			count = count + 1;
		endfor
		fprintf(fid, "\n");
	endfor
	
	fprintf(fid, "};\n");
	fprintf(fid, "\n");
	fprintf(fid, "uint16_t GammaCorrection(uint16_t input) {\n");
	fprintf(fid, "\treturn pgm_read_word(&gammaValues[input]);\n");
	fprintf(fid, "}\n");
	fprintf(fid, "\n");
	fprintf(fid, "#endif\n");
	fclose(fid);
endfunction
