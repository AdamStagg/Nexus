#pragma once

#include "Core.h"

#include "Window.h"
#include "Nexus/LayerStack.h"
#include "Nexus/Events/Event.h"
#include "Nexus/Events/ApplicationEvent.h"


namespace Nexus {

	class NEXUS_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();

		void OnEvent(Event& e);

		void PushLayer(Layer* layer);
		void PushOverlay(Layer* overlay);
	private:
		bool OnWindowClose(WindowCloseEvent& e);

		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
		LayerStack m_LayerStack;
	};

	//To be defined in client
	Application* CreateApplication();
}

