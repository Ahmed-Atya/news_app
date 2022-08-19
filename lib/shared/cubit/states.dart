abstract class NewsAppStates {}
//Initial State
class NewsInitialState extends NewsAppStates {}
//Bottom Navbar State
class NewsBottomNavbarState extends NewsAppStates {}

//Business States
class NewsGetBusinessLoadingState extends NewsAppStates {}
class NewsGetBusinessSuccessState extends NewsAppStates {}
class NewsGetBusinessErrorState extends NewsAppStates {}

//Science States
class NewsGetScienceLoadingState extends NewsAppStates {}
class NewsGetScienceSuccessState extends NewsAppStates {}
class NewsGetScienceErrorState extends NewsAppStates {}

//Sport States
class NewsGetSportLoadingState extends NewsAppStates {}
class NewsGetSportSuccessState extends NewsAppStates {}
class NewsGetSportErrorState extends NewsAppStates {}

//Change theme Mode
class NewsAppModeCahngeState extends NewsAppStates {}

//search States
class NewsGetSearchLoadingState extends NewsAppStates {}
class NewsGetSearchSuccessState extends NewsAppStates {}
class NewsGetSearchErrorState extends NewsAppStates {}
