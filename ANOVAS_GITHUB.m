clear all
close all

data=readtable('./AllDataAveragesGithub.csv');

% mean fixation duration
labels = {'H 1^{st}', 'V 1^{st}', 'V 2^{nd}'};
unipp=unique(data.participant);

anovatab=[];
for cond=1:3
    pos=find((data.condition_1_hapticFist_2_visualFirst_3_visualSec==cond));
  meanFixDuration(cond)=mean(data.meanFixationDuration(pos));
 seFixDuration(cond)=std(data.meanFixationDuration(pos))/sqrt(length(pos));

 anovatab=[anovatab data.meanFixationDuration(pos)];
end


T = array2table(anovatab, 'VariableNames', labels);

% Write to CSV
writetable(T, 'fixation_duration_table.csv');
resultsFixDuration=runRMAnovaR('./fixation_duration_table.csv');


f=figure;
hb=bar(1:3,meanFixDuration);
hb.FaceColor=ones(1,3)*.5;
hb.EdgeColor=ones(1,3)*.5;
hold on
errorbar(1:3,meanFixDuration,seFixDuration,'k.','linewidth',2)
ylim([550 790])
set(gca,'LineWidth',3,'FontSize',20,'XTick',1:3,'XTickLabel',labels)
box off
ylabel("Fixation Duration (ms)",'FontSize',25);
axis square

% Significance bar parameters
lineY = max(meanFixDuration + seFixDuration) + 30;      % Line above error bars
lineSpacing = 5;                       % Vertical spacing between line and star

% Between bar 1 and bar 3
plot([1, 3], [lineY, lineY], 'k', 'LineWidth', 1.5)       % Horizontal line
text(2, lineY + lineSpacing, '*', 'FontSize', 30, 'HorizontalAlignment', 'center')

lineY = max(meanFixDuration + seFixDuration) + 10; 
lineSpacing=5;
plot([1, 2], [lineY, lineY], 'k', 'LineWidth', 1.5)       % Horizontal line
text(1.5, lineY + lineSpacing, '*', 'FontSize', 30, 'HorizontalAlignment', 'center')



exportgraphics(f, 'mean_fixation_duration_new.svg', 'ContentType', 'vector');
close(f);



%% saccade speed
anovatab=[];
for cond=1:3
    pos=find((data.condition_1_hapticFist_2_visualFirst_3_visualSec==cond));
  meanSaccadicSpeed(cond)=mean(data.meanSaccadicSpeed_deg_sec_(pos));
 seSaccadicSpeed(cond)=std(data.meanSaccadicSpeed_deg_sec_(pos))/sqrt(length(pos));
 anovatab=[anovatab data.meanSaccadicSpeed_deg_sec_(pos)];
end


T = array2table(anovatab, 'VariableNames', labels);

% Write to CSV
writetable(T, 'saccadic_speed_table.csv');
resultsSaccadicSpeed=runRMAnovaR('./saccadic_speed_table.csv');


f=figure;
hb=bar(1:3,meanSaccadicSpeed);
hb.FaceColor=ones(1,3)*.5;
hb.EdgeColor=ones(1,3)*.5;
hold on
errorbar(1:3,meanSaccadicSpeed,seSaccadicSpeed,'k.','linewidth',2)
ylim([60 83])
set(gca,'LineWidth',3,'FontSize',20,'XTick',1:3,'XTickLabel',labels)
box off
ylabel("Saccadic Speed (deg/sec)",'FontSize',25);
axis square
 
% Significance bar parameters
lineY = max(meanSaccadicSpeed + seSaccadicSpeed) +.5;      % Line above error bars
lineSpacing = .5;                       % Vertical spacing between line and star

% Between bar 1 and bar 3
plot([1, 3], [lineY, lineY], 'k', 'LineWidth', 1.5)       % Horizontal line
text(2, lineY + lineSpacing, '*', 'FontSize', 30, 'HorizontalAlignment', 'center')

lineY = max(meanSaccadicSpeed + seSaccadicSpeed) + 2.5;      % Line above error bars
lineSpacing = 1;                       % Vertical spacing between line and star

plot([1, 2], [lineY, lineY], 'k', 'LineWidth', 1.5)       % Horizontal line
text(1.5, lineY + lineSpacing, '*', 'FontSize', 30, 'HorizontalAlignment', 'center')

exportgraphics(f, 'mean_saccadic_speed_new.svg', 'ContentType', 'vector');
close(f);


%% saccade amplitude
anovatab=[];
for cond=1:3
    pos=find((data.condition_1_hapticFist_2_visualFirst_3_visualSec==cond));
  meanSaccadicAmp(cond)=mean(data.meanSaccadicAmplitude_deg_(pos));
 seSaccadicAmp(cond)=std(data.meanSaccadicAmplitude_deg_(pos))/sqrt(length(pos));
 anovatab=[anovatab data.meanSaccadicAmplitude_deg_(pos)];
end


T = array2table(anovatab, 'VariableNames', labels);

% Write to CSV
writetable(T, 'saccadic_amplitude_table.csv');
resultsSaccadicAmplitude=runRMAnovaR('./saccadic_amplitude_table.csv');


f=figure;
hb=bar(1:3,meanSaccadicAmp);
hb.FaceColor=ones(1,3)*.5;
hb.EdgeColor=ones(1,3)*.5;
hold on
errorbar(1:3,meanSaccadicAmp,seSaccadicAmp,'k.','linewidth',2)
ylim([2 3.5])
set(gca,'LineWidth',3,'FontSize',20,'XTick',1:3,'XTickLabel',labels)
box off
ylabel("Saccadic Amplitude (deg)",'FontSize',25);
axis square
 
% Significance bar parameters
lineY = max(meanSaccadicAmp + seSaccadicAmp) + .2;      % Line above error bars
lineSpacing = .05;                       % Vertical spacing between line and star

% Between bar 1 and bar 3
plot([1, 3], [lineY, lineY], 'k', 'LineWidth', 1.5)       % Horizontal line
text(2, lineY + lineSpacing, '*', 'FontSize', 30, 'HorizontalAlignment', 'center')

lineY = max(meanSaccadicAmp + seSaccadicAmp) + .05;      % Line above error bars
lineSpacing = .05;                       % Vertical spacing between line and star

plot([1, 2], [lineY, lineY], 'k', 'LineWidth', 1.5)       % Horizontal line
text(1.5, lineY + lineSpacing, '*', 'FontSize', 30, 'HorizontalAlignment', 'center')

exportgraphics(f, 'mean_saccadic_amplitude_new_mt.svg', 'ContentType', 'vector');
close(f);
%% number of fixations
anovatab=[];
for cond=1:3
    pos=find((data.condition_1_hapticFist_2_visualFirst_3_visualSec==cond));
  meanNumFix(cond)=mean(6*data.numberOfFixations(pos)); % times number of trials
 seNumFix(cond)=std(6*data.numberOfFixations(pos))/sqrt(length(pos));
 anovatab=[anovatab 6*data.numberOfFixations(pos)];
end


T = array2table(anovatab, 'VariableNames', labels);

% Write to CSV
writetable(T, 'number_of_fixations_table.csv');
resultsNumberOfFixations=runRMAnovaR('./number_of_fixations_table.csv');


f=figure;
hb=bar(1:3,meanNumFix); 
hb.FaceColor=ones(1,3)*.5;
hb.EdgeColor=ones(1,3)*.5;
hold on
errorbar(1:3,meanNumFix,seNumFix,'k.','linewidth',2)
ylim([5.98 6.02])
set(gca,'LineWidth',3,'FontSize',20,'XTick',1:3,'XTickLabel',labels)
box off
ylabel("Number of fixations per trial",'FontSize',25);
axis square
exportgraphics(f, 'number_of_fixations_per_trial_new_mt.svg', 'ContentType', 'vector');
close(f);
