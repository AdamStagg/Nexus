#pragma once

#ifdef NX_PLATFORM_WINDOWS
	
extern Nexus::Application* Nexus::CreateApplication();

int main(int argc, char** argv)
{
	Nexus::Log::Init();

	Nexus::Application* app = Nexus::CreateApplication();
	app->Run();
	delete app;
}

#endif
