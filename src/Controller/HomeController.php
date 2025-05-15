<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
        if($this->isGranted('ROLE_Admin')) {
//           dd("test 1");
            return $this->redirectToRoute('app_admin');

        }
//        dd("test ali");
//        dd($this->getUser()->getRoles());
        if($this->isGranted('ROLE_SPECIALIST')) {
//           dd("test 1");
            return $this->redirectToRoute('app_specialist_home');

        }

        if($this->isGranted('ROLE_PATIENT')) {
//            dd("test 2");
            return $this->redirectToRoute('app_patient_home');
        }
//        dd("test 3");
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }
}
