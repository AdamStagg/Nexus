#pragma once

#ifdef NX_PLATFORM_WINDOWS
	
extern Nexus::Application* Nexus::CreateApplication();

int main(int argc, char** argv)
{
	Nexus::Log::Init();

	int myInt = 5;
	NX_CORE_ERROR("There was an error, the variable was {0}", myInt);
	NX_CORE_WARN("There was an error, the variable was {0}", myInt);
	NX_CORE_INFO("There was an error, the variable was {0}", myInt);
	NX_CORE_CRITICAL("There was an error, the variable was {0}", myInt);
	NX_CORE_TRACE("There was an error, the variable was {0}", myInt);

	

	Nexus::Application* app = Nexus::CreateApplication();
	app->Run();
	delete app;
}

#endif
