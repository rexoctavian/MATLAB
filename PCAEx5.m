% CS 5810  -- Programming for data analysis 
%
%  Assignment 3 | Prof. Alberto Paccanaro
%  
%
% 
% Insert BELOW your code 

% INSERT YOUR CODE HERE!


% Part 1
data = importdata("pcadata.mat");
figure;
axis([0 7 2 8]);
scatter(data(:,1), data(:,2), 15, 'b', 'o');


[Xmu, mu] = subtractMean(data);
[U, S] = myPCA(Xmu);
G = U + mu.';
hold on;

line([mu(1) G(1,1)], [mu(2), G(2,1)], 'Color','red');
line([mu(1) G(1,2)], [mu(2), G(2,2)], 'Color', 'green');

K = 1;

Z = projectData(Xmu, U, K);
Z(1:3);

Xrec = recoverData(Z, U, K, mu);
figure;
hold on;
axis([0 7 2 8]);
scatter(data(:,1), data(:,2), 15, 'b', 'o');
scatter(Xrec(:,1), Xrec(:,2), 50, 'r', '*');

clc
% Part 2
figure;
X = importdata("pcafaces.mat");
%scatter(X(:,1), X(:,2), 15, 'b', 'o');
displayData(X(1:100, :));
% Subtracted mean data set and mean
[X_minus_mu, mean] = subtractMean(X);
[Eigenvectors, Eigenvalues] = myPCA(X_minus_mu);
projected_data = projectData(X_minus_mu, Eigenvectors, 200);
recovered_data = recoverData(projected_data, Eigenvectors, 200, mean);
scatter(X(:,1), X(:,2), 15, 'b', 'o');
scatter(recovered_data(:,1), recovered_data(:,2), 50, 'r', '*');

figure;
subplot(1,2,1), displayData(X(1:100, :));
subplot(1,2,2), displayData(recovered_data(1:100, :));
