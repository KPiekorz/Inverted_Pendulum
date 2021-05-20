function [quality] = quality_indicator_rmse(real_states, non_lin_states)

cart_pos_weight = 0.4;
pend_ang_weight = 0.4;
cart_velo_weight = 0.1;
pend_ang_velo_weight = 0.1;

fft_cart_pos = 0;
fft_pend_ang = 0;
fft_cart_velo = 0;
fft_pend_ang_velo = 0;


quality = (fft_cart_pos * cart_pos_weight) + (fft_pend_ang * pend_ang_weight) + (fft_cart_velo * cart_velo_weight) + (fft_pend_ang_velo * pend_ang_velo_weight);
end

