% inputs - 2 matrices with states x and theta
% size - n x 2, where n is samples number
%% set time, etc.
T = 20;
sim_step = 0.01;
step_value = 10;
time = 0:sim_step:T;
angle_weight = 0.9;
position_weight = 0.1;

%% simulate real object and extract states

sim('lin_kw_sim.slx',T);
real_object_states(:,1:2) = states(:,1:2);

%% set starting point for identification and calculate mean-squared error

ff = 0.00001; ll = 0.001;
f = ff; l = ll;
sim('object_to_identify',T);
best_f = f; best_l = l;
ident_obj_states(:,1:2) = states(:,1:2);
best_fit = position_weight*(sqrt(sum(abs(real_object_states(:,1)-ident_obj_states(:,1)).^2))) + ...
    angle_weight*(sqrt(sum(abs(real_object_states(:,2)-ident_obj_states(:,2)).^2)));

fff = [];
lll = [];
fitfit = [];
for f = ff:0.00001:0.0003
    for l = ll:0.005:0.05
        tic
        sim('object_to_identify',T);
        ident_obj_states(:,1:2) = states(:,1:2);
        fit = position_weight*(sqrt(sum(abs(real_object_states(:,1)-ident_obj_states(:,1)).^2))) + ...
            angle_weight*(sqrt(sum(abs(real_object_states(:,2)-ident_obj_states(:,2)).^2)))
        if fit <= best_fit
            best_f = f; best_l = l;
            best_fit = fit;
        end
        lll = [lll,l];
        fff = [fff,f];
        fitfit = [fitfit,fit];
    end
end
elapsed_time
%% present result
best_l, best_f
l = best_l;
f = best_f;

sim('object_to_identify',T);
figure(1);
subplot(2,1,1)
plot(time,real_object_states(:,1));
hold on
plot(time,cart_position);
subplot(2,1,2)
plot(time,real_object_states(:,2));
hold on
plot(time,pendulum_angle);


    
    
