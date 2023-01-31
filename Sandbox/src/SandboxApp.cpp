
#include <Nexus.h>

class Sandbox : public Nexus::Application
{
public:
	
	Sandbox()
	{

	}

	~Sandbox() 
	{

	}


};


namespace Nexus
{
	NEXUS_API void print();

}

Nexus::Application* Nexus::CreateApplication()
{
	return new Sandbox();
}