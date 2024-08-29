load allFaces.mat

% training data
trainingData = faces(:, 1:sum(nfaces(1:36)));
average = mean(trainingData, 2);  

X_data = trainingData - average * ones(1, size(trainingData, 2));
[U_data, S_data, V_data] = svd(X_data, 'econ');
figure, axes('position', [0 0 1 1]), axis off
imagesc(reshape(average, n, m)), 
colormap gray;

figure
for i = 1:50  
    pause(0.1);  
    imagesc(reshape(U_data(:, i), n, m)); colormap gray;
end

figure
test = faces(:, 1 + sum(nfaces(1:36))); 
axes('position', [0 0 1 1]), axis off
imagesc(reshape(test, n, m)), colormap gray
testFaceMS_data = test - average;

figure
for r = 25:25:2275
    reconFaceData = average + (U_data(:, 1:r) * (U_data(:, 1:r)' * testFaceMS_data));
    imagesc(reshape(reconFaceData, n, m)), colormap gray
    title(['r=', num2str(r, '%d')]);
    pause(0.1)
end

person1= 2;  % person 2
person2= 7;  % person 7
person1Data = faces(:, 1 + sum(nfaces(1:person1- 1)):sum(nfaces(1:person1)));
person2Data = faces(:, 1 + sum(nfaces(1:person2- 1)):sum(nfaces(1:person2)));
person1Data = person1Data - average * ones(1, size(person1Data, 2));
person2Data = person2Data - average * ones(1, size(person2Data, 2));

figure
subplot(1, 2, 1), imagesc(reshape(person1Data(:, 1), n, m)); colormap gray, axis off
subplot(1, 2, 2), imagesc(reshape(person2Data(:, 1), n, m)); colormap gray, axis off


pcaModes_data = [5, 6];
pcaCoordsPerson1 = U_data(:, pcaModes_data)' * person1Data;
pcaCoordsPerson2 = U_data(:, pcaModes_data)' * person2Data;
figure
plot(pcaCoordsPerson1(1, :), pcaCoordsPerson1(2, :), 'kd', 'MarkerFaceColor', 'k')
axis([-4000 4000 -4000 4000]), hold on, grid on
plot(pcaCoordsPerson2(1, :), pcaCoordsPerson2(2, :), 'r^', 'MarkerFaceColor', 'r')
set(gca, 'XTick', [0], 'YTick', [0]);
