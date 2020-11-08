function [out, out_top] = hadamard_encoding(f, m)
out = [];
out_top = [];
factor = 2^m;
Hm = (1/sqrt(factor))*hadamard(factor) % Generating an mxm hadamard matrix.
for r = 1:(floor(size(f, 1)/factor)-1)
    so_row = [];
    st_row = [];
    for c = 1:(floor(size(f, 2)/factor)-1)
        %% ---------- How to transform an image with a Hadamard metrix ----------------------
        row = (r*factor)+1;
        col = (c*factor)+1;
        row_next = (r+1)*factor;
        col_next = (c+1)*factor;
        
        fm = double(f(row:row_next, col:col_next));     % Cropping an mxm top-left image (f).
        F = Hm*fm*Hm';                          % transforming the image, fm, to Hadamard domain by Hm.

        %% ---------- Energy Preservation -----------------------------
        e1 = sum(sum(fm.^2));
        e2 = sum(sum(F.^2));

        %% ---------- Energy Compaction -------------------------------
        Q = zeros(factor, factor);          % A selection matrix
        Q(1:factor/2, 1:factor/2) = 1;

        Top3 = (F.*Q);               % Selecting top-3 of Hadamard coofficients.
        e_Top3 = sum(sum(Top3.^2));  % Energy of top-3 coefficients.
        E_compact = (e_Top3/e1)*100; % Calculating percentage of energy compaction.

        %% ----------- Image Restoration ------------------------------
        fo = Hm'*F*Hm;
        ft = Hm'*Top3*Hm;
        
        so_row = [so_row, fo];
        st_row = [st_row, ft];
    end
    out = [out; so_row];
    out_top = [out_top; st_row];
end
