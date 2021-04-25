

par = [0.41; 0.2];
aux = {};
T = 0;
m = idgrey('model_structure',par,'c',aux,T);

opt1 = greyestOptions('EnforceStability', true)

m_est = greyest(out.data, m, opt1)