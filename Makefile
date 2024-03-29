CC = g++
FLAG = -std=c++17

platformer: main.o StaticPlatform.o Player.o MovingPlatform.o GeneralPlatform.o Entity.o Thread.o Timeline.o Spawnpoint.o SpecialZone.o Boundary.o Event.o EventManager.o DeathHandler.o SpawnHandler.o CollisionHandler.o InputHandler.o 
	$(CC) main.o Entity.o GeneralPlatform.o StaticPlatform.o Player.o MovingPlatform.o Spawnpoint.o SpecialZone.o Thread.o Timeline.o Boundary.o Event.o EventManager.o DeathHandler.o SpawnHandler.o CollisionHandler.o InputHandler.o -o platformer -lsfml-window -lsfml-graphics -lsfml-system -pthread

client: StaticPlatform.o Player.o MovingPlatform.o GeneralPlatform.o Entity.o Thread.o Timeline.o Spawnpoint.o SpecialZone.o client.cpp Boundary.o Event.o EventManager.o DeathHandler.o SpawnHandler.o CollisionHandler.o InputHandler.o
	$(CC) client.cpp Entity.o Spawnpoint.o SpecialZone.o GeneralPlatform.o StaticPlatform.o Player.o MovingPlatform.o Thread.o Timeline.o Boundary.o Event.o EventManager.o DeathHandler.o SpawnHandler.o CollisionHandler.o InputHandler.o -o client -lzmq -lsfml-window -lsfml-graphics -lsfml-system -pthread

server: StaticPlatform.o Player.o MovingPlatform.o GeneralPlatform.o Entity.o Thread.o Timeline.o Spawnpoint.o SpecialZone.o server.cpp Boundary.o Event.o EventManager.o DeathHandler.o SpawnHandler.o CollisionHandler.o InputHandler.o
	$(CC) server.cpp Entity.o Spawnpoint.o SpecialZone.o GeneralPlatform.o StaticPlatform.o Player.o MovingPlatform.o Thread.o Timeline.o Boundary.o Event.o EventManager.o DeathHandler.o SpawnHandler.o CollisionHandler.o InputHandler.o -o server -lzmq -lsfml-window -lsfml-graphics -lsfml-system -pthread

main.o: main.cpp
	$(CC) -c $(FLAG) main.cpp

flappyBirdClient: Player.o Entity.o Thread.o Spawnpoint.o SpecialZone.o FlappyBirdClient.cpp Event.o EventManager.o DeathHandler.o SpawnHandler.o InputHandler.o
	$(CC) FlappyBirdClient.cpp Entity.o Spawnpoint.o SpecialZone.o Player.o Event.o EventManager.o DeathHandler.o SpawnHandler.o InputHandler.o $(FLAG) -o flappyBirdClient -lzmq -lsfml-window -lsfml-graphics -lsfml-system -pthread

flappyBirdServer: Player.o Entity.o Thread.o Timeline.o FlappyBirdServer.cpp
	$(CC) FlappyBirdServer.cpp Entity.o Player.o Timeline.o $(FLAG) -o flappyBirdServer -lzmq -lsfml-window -lsfml-graphics -lsfml-system -pthread

Thread.o: Thread.cpp Thread.h
	$(CC) -c $(FLAG) Thread.cpp

Timeline.o: Timeline.h Timeline.cpp
	$(CC) -c $(FLAG) Timeline.cpp

Entity.o: Entity.cpp Entity.h
	$(CC) -c $(FLAG) Entity.cpp

GeneralPlatform.o: GeneralPlatform.cpp GeneralPlatform.h
	$(CC) -c $(FLAG) GeneralPlatform.cpp

StaticPlatform.o: StaticPlatform.cpp StaticPlatform.h
	$(CC) -c $(FLAG) StaticPlatform.cpp

Player.o: Player.cpp Player.h
	$(CC) -c $(FLAG) Player.cpp

MovingPlatform.o: MovingPlatform.cpp MovingPlatform.h
	$(CC) -c $(FLAG) MovingPlatform.cpp

SpecialZone.o: SpecialZone.cpp SpecialZone.h
	$(CC) -c $(FLAG) SpecialZone.cpp

Spawnpoint.o: Spawnpoint.cpp Spawnpoint.h
	$(CC) -c $(FLAG) Spawnpoint.cpp

Boundary.o: Boundary.cpp Boundary.h
	$(CC) -c $(FLAG) Boundary.cpp

Event.o: Event.cpp Event.h
	$(CC) -c $(FLAG) Event.cpp

EventManager.o: EventManager.cpp EventManager.h
	$(CC) -c $(FLAG) EventManager.cpp

DeathHandler.o: DeathHandler.cpp DeathHandler.h
	$(CC) -c $(FLAG) DeathHandler.cpp

SpawnHandler.o: SpawnHandler.cpp SpawnHandler.h
	$(CC) -c $(FLAG) SpawnHandler.cpp

InputHandler.o: InputHandler.cpp InputHandler.h
	$(CC) -c $(FLAG) InputHandler.cpp

CollisionHandler.o: CollisionHandler.cpp CollisionHandler.h
	$(CC) -c $(FLAG) CollisionHandler.cpp

clean:
	rm -f *.o
	rm -f platformer
	rm -f client
	rm -f server