function [quality] = quality_indicator_rmse(real_states, non_lin_states)

cart_pos_weight = 0.4;
pend_ang_weight = 0.4;
cart_velo_weight = 0.1;
pend_ang_velo_weight = 0.1;

rmse_cart_pos = sqrt(mean((real_states(:, 1) - non_lin_states(:, 1)).^2));
rmse_pend_ang = sqrt(mean((real_states(:, 2) - non_lin_states(:, 2)).^2));
rmse_cart_velo = sqrt(mean((real_states(:, 3) - non_lin_states(:, 3)).^2));
rmse_pend_ang_velo = sqrt(mean((real_states(:, 4) - non_lin_states(:, 4)).^2));

quality = (rmse_cart_pos * cart_pos_weight) + (rmse_pend_ang * pend_ang_weight) + (rmse_cart_velo * cart_velo_weight) + (rmse_pend_ang_velo * pend_ang_velo_weight);
end

