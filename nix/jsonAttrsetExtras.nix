{ customization, misc }:
{
  staticLibraryTab = customization.navigationBar.defaultTab;
  ytStyleButtonSwitcher = misc.ytStylePlayerButtonSwitcher;
  preferredSearchType = misc.preferredSearchTab;
  inherit (misc)
    tapToScroll
    enhancedDragToScroll
    smoothScrolling
    tiltingCardsEffect
    ;
}
