<?php
namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;

class TestController
{
    #[Route('/test', name: 'test')]
    public function __invoke(Request $request): Response
    {
        return new Response(json_encode(['message' => 'test']));
    }
}