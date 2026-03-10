{ cfg }:
{
  assertions =
    (with cfg.settings; [
      {
        assertion =
          (!appearance.autoColor && appearance.forceMiniPlayerFollowTrackColors)
          || (appearance.autoColor && !appearance.forceMiniPlayerFollowTrackColors);

        message = "autoColor and forceMiniPlayerFollowTrackColors must not be enabled at the same time";
      }
      {
        assertion = indexer.minimumTrackDuration <= 180 || indexer.minimumTrackDuration >= 0;
        message = "minimumTrackDuration must be an integer value between 0 and 180";
      }
      {
        assertion = indexer.minimumTrackDuration <= 10485760 || indexer.minimumTrackDuration >= 0;
        message = "minimumFileSize must be an integer value between 0 and 10485760";
      }
    ])
    ++ (with cfg.settingsRaw; [
      {
        assertion = !enable || enable && !merge && config != null;
        message = "If programs.namida.rawSettings.merge is set to false, programs.namida.rawSettings.config must not be null";
      }
    ]);
}
