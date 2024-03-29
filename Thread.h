#pragma once

#include "Entity.h"
#include "MovingPlatform.h"
#include "Player.h"
#include <mutex>
#include <condition_variable>
#include <thread>
#include <chrono>
#include <memory>
#include "EventManager.h"
#include "Event.h"
#include "InputHandler.h"
#include "CollisionHandler.h"

class Thread {

    private:
        bool busy; //if thread is currently busy

        int identity; //id of thread

        Thread *other; //ptr to other thread

        std::mutex *_mutex; //mutex lock

        std::condition_variable *_condition_variable; //cv

    public:
        Thread(int i, Thread *other, std::mutex *m, std::condition_variable *cv); //constructor

        bool isBusy(); //check if busy

        void runMovement(std::vector<std::shared_ptr<MovingPlatform>>& moving, std::shared_ptr<Player> player, float deltaTime, std::vector<std::shared_ptr<Entity>>& list, bool move, EventManager *manager); //run threads 
};