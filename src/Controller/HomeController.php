<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    #[Route('/home', name: 'app_home')]
    public function index(): Response
    {
        if($this->isGranted('ROLE_PATIENT')) {
            return $this->redirectToRoute('app_patient_home');
        }
        if($this->isGranted('ROLE_SPECIALIST')) {
            return $this->redirectToRoute('app_specailist_home');
        }
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }
}
