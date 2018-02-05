%% ECE2026 MATLAB Review
% This document is the reference code for the ECE2026 MATLAB review. The
% actual review session is conducted live and more content may be covered
% than what is presented here especially regarding the MATLAB IDE and 
% SP-first toolbox installation. 


%% 1. Loading Data
% We'll see how to create data as we go, but first let's load some
% real-world data to work with. You've seen in lab that matlab has
% convenient functions to load audio data directly from sound files. In the
% interest of not spoiling anything from lab, this tutorial will not use
% audio files. Instead, we'll work with stock market data. Use the 'load' 
% command to import data from 'stocks.mat'

load stocks 
% OR 
% data = load('stocks.mat'); This creats a structure called data that
% fields having the same names as the valriables loaded from the command
% load stocks
% to acces the fields do:
% x = data.aapl_hi; (just an example)

%%
% Notice that you now have 6 variables in your workspace: the daily low and
% high stock prices for Apple, Google, and Microsoft. You can see from
% the workspace that each is a vector with 251 elements. You could also
% check that with the 'length' command.
% For example:

length(goog_lo)


%% 2. Indexing
% Since looking at 251 numbers is overwhelming, let's just look a small
% slice of the data. We can look at the first 5 elements of a vector by
% colon-notation indexing

goog_lo(1:5)

%%
% Of course we don't have to start at index 1 and we don't have to access
% every element - we can skip elements e.g. access every other element. For
% example, to grab all the odd indices between 3 and 15, we can do

goog_lo(3:2:15)

% The command tells us to get all elements between index 3 and 15 in steps 
% of 2. The basic syntax is *start:step:stop* and you can omit step to 
% default to step = 1. 

%Note that if we wanted to go all the way to the end,
% we have 2 options

goog_lo(3:2:length(goog_lo));
% OR 
goog_lo(3:2:end);

% The above are equivalent (the full output is suppressed by the
% semi-colons). You can take them out and run it to see all the vector
% values and confirm they are equivalent. See example 3b of Section 4 for 
% another way to check equality of vectors.

% A note about the data: the first element represents the most recent
% datapoint. This is typically the reverse of what we see in signal
% processing; usually the first element of a vector corresponds to the 
% first or oldest timepoint. Let's flip our data so that the first index
% corresponds to the oldest date. 
%
% Again, we use matlab colon-notation indexing along with the convenient 
% fact that the *start:step:stop* syntax does NOT have to be increasing
% i.e. the step size can be negative.

goog_lo = goog_lo(end:-1:1);
goog_hi = goog_hi(end:-1:1);
aapl_lo = aapl_lo(end:-1:1);
aapl_hi = aapl_hi(end:-1:1);
msft_lo = msft_lo(end:-1:1);
msft_hi = msft_hi(end:-1:1);

% We've just reversed the order of the elements for each vector by indexing
% each element (step = 1) starting from the end and going until the 1st
% element. 

%% 3. Plotting
% We've used matlab indexing to look at slices of the data, but now let's
% look at the entire dataset graphically using matlabs plotting
% capabilities. At the most basic level, plot() with just a single argument
% will get the job done.

plot(goog_lo)

% Notice that the stock prices were interpretted as the y-axis values and
% matlab automatically made the x-axis starting at 1. Let's change it
% slightly to start at 0. To do so, we need to make our own x-axis vector
% that has the same number of elements as our data, starts at 0, and
% increases by 1. This is easy made using matlab colon notation. Then we
% add it as an arguement in the plot() command

dd = 0:length(goog_lo)-1; % Verify this has the same # of elements
plot(dd, msft_lo) % Notice: msft not goog

%% 
% Notice that the new plot overwrote the old plot. Often, it will be
% desirable to create a whole new plot instead of overwriting the old one.
% In matlab lingo, we need to create a new *figure window*. Do so by typing
% 'figure' before plotting. Everything after the 'figure' command will be
% plotted in a new window.

figure
plot(dd, aapl_lo)

%%
% In the last 3 plots, we've switched between plotting Google, Microsoft,
% and Apple stock prices, but we never labeled the graphs so we don't know
% which one is which! 

% Always include some basic plot annotations such as
% titles or axis labels. 

% The commands to do so are simple and some examples
% are below. I'll also change the linestyle of the plot by passing in a 3rd
% argument to plot(). See the link below for more linestyle options:
%
% https://www.mathworks.com/help/matlab/ref/linespec.html
%

figure
plot(dd, goog_lo, 'r--') % 'r--' means red dashed line
title('Google Daily Low Prices')
xlabel('Days Since Aug 29 2016')
ylabel('US Dollars')

%%
% Now let's make the plots a little more complex by plotting 2 curves in 1
% graph. Matlab makes this easy. You can simply pass multiple x,y pairs or 
% x,y,linestyle triplets to the plot() command.
%
% For this example, we'll plot the opening and closing prices of Google
% stock. In addition to the plot() syntax, notice the new 'legend' command
% that controls the legend labels. legend() takes in labels in the same
% order as they appear in the plot() command. Also, you can specify the
% location of the legend or have matlab automatically choose the best
% position for you.

figure
plot(dd, goog_lo, 'b-', dd, goog_hi, 'b--')
title('Google Daily Low/High Prices')
xlabel('Days Since Aug 29 2016')
ylabel('US Dollars')
legend('LOW', 'HIGH', 'location','best')

%%
% Let's compute the daily average of the daily high and
% low prices. In our case, for each day, we need to add the low and high
% prices then divide by 2. This is easily done with matlabs vectorized
% operations.
% Order of operations follow standard mathematical rules ie. BOMDAS
% (Brackets Of Multiplication Division Addition Subtraction)

aapl_mid = (aapl_hi + aapl_lo)/2;
goog_mid = (goog_hi + goog_lo)/2;
msft_mid = (msft_hi + msft_lo)/2;

%%
% Let's plot the averages for each company.

figure
plot(dd, aapl_mid, 'r-', dd, goog_mid, 'm-', dd, msft_mid, 'c-')
title('Daily Middle Prices')
xlabel('Days Since Aug 29 2016')
ylabel('US Dollars')
legend('AAPL', 'GOOG', 'MSFT', 'location','best')

%% Subplots
% Let's combine all of our work so far into a single image. That is, let's
% make one image with 4 graphs: 1 graph per company showing daily highs and
% lows plus 1 graph with the average of each company.
%
% We will use matlab's 'subplot()' function which essentially creates a 
% grid of cells into which you may plot. The general syntax is
% *subplot(XYZ)* where X is the number of rows in the grid, Y is the number
% of columns, and Z is the current element of the grid (starting with 1 =
% top left and proceeding left-to-right, top-to-bottom). For example, to
% create a 2x2 grid and graph in the top-right corner, use
%
% subplot(222).
%
% For our example, let's create a 2x2 grid and fill it out alaphabetically 
% so that Apple is in the top left, Google is in the top right, Microsoft 
% in the bottom left, and the averages in the bottom right.

figure
subplot(221)
plot(dd, aapl_lo, 'r-', dd, aapl_hi, 'r--')
title('Apple')
xlabel('Days Since Aug 29 2016')
ylabel('US Dollars')
legend('LOW', 'HIGH', 'location','best')
subplot(222)
plot(dd, goog_lo, 'm-', dd, goog_hi, 'm--')
title('Google')
xlabel('Days Since Aug 29 2016')
ylabel('US Dollars')
legend('LOW', 'HIGH', 'location','best')
subplot(223)
plot(dd, msft_lo, 'c-', dd, msft_hi, 'c--')
title('Microsoft')
xlabel('Days Since Aug 29 2016')
ylabel('US Dollars')
legend('LOW', 'HIGH', 'location','best')
subplot(224)
plot(dd,aapl_mid, 'r-', dd, goog_mid, 'm-', dd, msft_mid, 'c-')
title('Daily Middle Prices')
xlabel('Days Since Aug 29 2016')
ylabel('US Dollars')
legend('AAPL', 'GOOG', 'MSFT', 'location','best')

%% 4. Vectorization
% Loops can be useful in MATLAB but should be used as a last resort. Try
% vectorizing. In a loop, you access elements of an array individually and
% operate on the individual elements. With vectorization, you operate on
% the entire vector at once. Under the hood, this is much more efficient 
% (ie. faster).
%
% This section consists of examples that are solved both via traditional
% loops and vectorization.

%%
% *Example 1: Averaging*
%
% Let's calculate the average high prices over 1 year for google. If using
% loops, it might loop like

goog_hi_avg = 0;
for price = goog_hi
    goog_hi_avg = goog_hi_avg + price;
end
goog_hi_avg = goog_hi_avg / length(goog_hi)

% Not too bad, but we can shorten it using handy, vectorized MATLAB
% functions.
goog_hi_avg = sum(goog_hi)/length(goog_hi)

% OR (even better!)
goog_hi_avg = mean(goog_hi) % the built-in command to find average

% All the above results were identical, but the vectorized code is quite
% clean and simple.

%%
% *Example 2: Indexing*
%
% We've already seen how vectors and the colon notation can be used for
% indexing. This example demonstrates how we can use such indexing to
% replace a while loop.
%
% Let's obtain the daily high prices for every Wednesday in our
% dataset. 
% Our data (after putting it in chronological order)
% starts on Monday August 29 2016. Also note that stocks dont trade on
% weekends. Assume that the dataset is perfect and no days are skipped
% (this is not necessarily true - the dataset was cleaed).
%
% With the above in mind, it is clear that the first Wednesday corresponds
% to index 3 and every subsequenct Wednesday will occur 5 (business) days
% after that. In a loop, we can access as

goog_hi_weds = []; % Vector to hold Wednesday data
ndx = 3; % Starting point
while ndx <= length(goog_hi)
    goog_hi_weds = [goog_hi_weds goog_hi(ndx)]; % horizontal concatenation
    ndx = ndx + 5;
end

% Vectorzing is even easier
goog_hi_weds_v = goog_hi(3:5:end);

% Check that they are the same by plotting. They should overlap.
ww = 1:length(goog_hi_weds);
figure
plot(ww,goog_hi_weds,'b-', ww, goog_hi_weds_v, 'r--')
title('GOOG Wednesday High Prices')
xlabel('Wednesdays Since Aug 29 2016')
ylabel('US Dollars')
legend('Loop', 'Vectorization')

%% 
% *Example 3a: Assignment*
%
% The colon-notation indexing can also be used for assignment to arrays not
% just access.
%
% Let's create a fake company, Applesoft, whose stock price peculiarly 
% alternates daily between Apple and Microsoft prices. On August 29 2016
% (when our data starts) it was Apple, then Microsoft on August 30 2016,
% etc. How can we construct the a vector of daily highs and lows for this
% company like we currently have for Apple, Microsoft, and Google?
%
% If we were looping, it might look something like

apsf_lo = zeros(size(aapl_lo));
apsf_hi = zeros([1 251]); % Same as above, except ths is hardcoded (bad)
ndx = 1;
while ndx <= length(aapl_lo)
   if (mod(ndx,2) == 0) % even (mod is the remainder after a division)
       apsf_lo(ndx) = msft_lo(ndx);
       apsf_hi(ndx) = msft_hi(ndx);
   else
       apsf_lo(ndx) = aapl_lo(ndx);
       apsf_hi(ndx) = aapl_hi(ndx);
   end
   
   ndx = ndx + 1;
end

%%%
% Again, it is neater to do with vectorization.

% Initialize
apsf_lo_v = zeros(size(aapl_lo));
apsf_hi_v = zeros([1 251]);
% Assign AAPL (odd days)
apsf_lo_v(1:2:end) = aapl_lo(1:2:end);
apsf_hi_v(1:2:end) = aapl_hi(1:2:end);
% Assign MSFT (even days)
apsf_lo_v(2:2:end) = msft_lo(2:2:end);
apsf_hi_v(2:2:end) = msft_hi(2:2:end);

%% 
% *Example 3b: Logical/Boolean*
%
% Although we could check the loop method is identical to the vectorization
% method by plotting as we did in Example 2, the data here is very messy
% because of how it was artificially generated. Instead, let's check they
% are the same by logical comparison.
%
% Using loops, we would check each element one-by-one in both vectors to
% see if the vectors are identical. For brevity, I will only check the
% Applesoft daily high vectors.

equal = true; % Assume true at the beginning
ndx = 1; % Starting point
while ndx <= length(apsf_hi)
   if apsf_hi(ndx) ~= apsf_hi_v(ndx)
       equal = false;
       break
   end
   ndx = ndx + 1;
end
if equal
    disp('Identical')
else
    disp('Not Identical')
end

%%
% The above prints "Identical" to the screen and thus our vectorization
% methods in Example 3a was valid.
%
% Let's check that again using vectorization. MATLAB can compare vectors
% for equality point-by-point simply with the == operator. 

[1 2 3] == [1 0 3] % ans = [1 0 1]

%%
% Notice that comparing 2 vectors results in a vector with the same length.
% The vector is filled with 1's wherever the 2 vectors match and 0
% otherwise. Since we have 251 elements in our vectors, and we expect them
% ALL to be identical, it follows that we expect a result that is a vector
% of 251 1's. Thus, summing the result should equal 251. This is our
% approach for checking equality with vectorization.

if sum(apsf_hi == apsf_hi_v) == length(apsf_hi)
    disp('Identical')
else
    disp('Not Identical')
end

%%
% With a little bit of thinking and vectorization, we got rid of a lot of
% code. You can check that the above is valid by manually changing part of
% one of the vectors being compared and then rerun the equality check - it
% should fail. For example, type `apsf_hi(155) = 4` on the MATLAB console
% and rerun the code above.

%% Installing SP-First Toolbox
 
% visit http://dspfirst.gatech.edu/matlab/SPFirstMATLAB.html

%% Helpful Tips

% publish('review.m') generates html file of your code with plots
% publish('review.m', 'pdf') generates pdf file of your code with plots
% This is an easy way to compile your code you wrote in your 
% assignments/labs for submission when needed.

% edit filename.m this opens a newfile to be used a script or function
% doc someCommand
% help someCommand

% Also notice how this code has been sectioned. You can do this for each part of
% your labs rather than saving multiple script files. you can run each
% section with the 'run section' button on the 'editor' tab.


