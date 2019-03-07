\d .lfm

tm:{
  .lg.o"Running last.fm charts timer";
  if[not .lfm.valid[];:.lg.w"last.fm not enabled, chart timer aborted"];                        / exit if functionality disabled
  if[0=count .lfm.users;:.lg.w"No last.fm usernames provuded, chart timer aborted"];            / exit if no cached usernames
  if[0=count .lfm.o.charts;:.lg.w"No charts currently specified in .lfm.o.charts"];
  c:chart[];                                                                                    / get charts
  .lg.o"Posting last.fm charts to slack as lastfmbot in ",.lfm.channel;
  .slack.postase[c;.slack.chanlist .lfm.channel;"lastfmbot";":lastfm:"];                        / post charts as lastfmbot
 };

\d .

if[.lfm.valid[];                                                                                / only run if last.fm api key exists and functionality is enabled
  .timer.adddaily[`.lfm.tm;`;10:00;"2"]                                                         / add timer for daily run at 10:00, Monday
 ];