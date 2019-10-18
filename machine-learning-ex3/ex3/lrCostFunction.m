function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

k = 1:m;
thetaT = (theta)';
z = thetaT*(X(k,:))';

h = sigmoid(z');
vec = -y(k).*log(h(k)) - (1-y(k)).*log(1-h(k));
f = 2:length(theta);
J = (1/m)*sum(vec) + (lambda / (2*m))*sum((theta(f).^2)); 
grad1 = (1/m)*sum((h(k) - y(k)).*X(k,1));
grad2 = (1/m)*sum((h(k) - y(k)).*X(k,f)) + (lambda / m)*thetaT(f);
grad(1) = grad1;
grad(2:end) = grad2;








% =============================================================

%grad = grad(:);

end