clear; clc;
K = 20;
N = 5;
tslots = 100;
w = (randn(N,1) + 1i*randn(N,1)); %initial w vector
%w = w/norm(w);
for m = 1:5 %for averaging over 100 channel instances
    m
    sigma = ones(K,1);
    for k = 1:K
        M = 1/sqrt(2)*(randn(N,N)+1i*randn(N,N));
        R(:,:,k) = M*M';
    end
    [SNR(m,:), w, Rcap] = CMU2(R,w,tslots,K,N,sigma);
end
amSNR = mean(SNR,1);
plot(1:tslots,10*log10(real(amSNR)));
xlabel('Number of time slots');
ylabel('Average minimum SNR(dB)');
%legend('MU-SLA','MU')SNR(t)